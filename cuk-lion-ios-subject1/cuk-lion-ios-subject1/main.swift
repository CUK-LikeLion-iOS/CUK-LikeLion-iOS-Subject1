//
//  main.swift
//  cuk-lion-ios-subject1
//
//  Created by Jinyoung Yoo on 2023/03/13.
//

import Foundation

func showPeperoInform(pprLen: Int, pprBody: String, pprTopping: String, stickLen: Int) {
    print(
        """
        <정보>
        길이: \(pprLen)
        몸통: \(pprBody)
        토핑: \(pprTopping)
        막대길이: \(stickLen)

        """
    )
}

func drawPeperoChunk(pprBody: String, pprTopping: String) {
    var peperoChunck: String = pprBody

    if (pprTopping.isEmpty) {
        // 토핑이 없을 땐 양 옆에 공백문자 넣어줌
        peperoChunck = " " + peperoChunck + " "
    } else {
        // 오른쪽 토핑은 역순으로
        peperoChunck = pprTopping + peperoChunck + pprTopping.reversed()
    }
    print(peperoChunck)
}

func drawPeperoBody(pprLen: Int, pprBody: String, pprTopping: String) {
    if (pprBody == "|0|") {
        // 누드 빼빼로일 때
        for height in 1...pprLen {
            if (height % 2 == 0) {
                // 짝수번째일 때 "|0|" 넣어주기
                drawPeperoChunk(pprBody: pprBody, pprTopping: pprTopping)
            } else {
                drawPeperoChunk(pprBody: "| |", pprTopping: pprTopping)
            }
        }
    } else {
        // 누드 빼빼로가 아닐 때
        for _ in 1...pprLen {
            drawPeperoChunk(pprBody: pprBody, pprTopping: pprTopping)
        }
    }
}

func drawStick(stickLen: Int, pprBodyLength: Int, pprToppingLength: Int) {
    var stick: String = ""
    let stickInitPos: Int = (pprToppingLength == 0) ? 1 : pprToppingLength


    // 막대기의 왼쪽 부분
    for _ in 1...stickInitPos {
        stick.append(" ")
    }
    stick.insert("|", at: stick.endIndex)


    // 막대기의 오른쪽 부분
    for _ in 1..<(pprBodyLength - 1) {
        stick.append(" ")
    }
    stick.insert("|", at: stick.endIndex)

    // 막대기 출력
    for _ in 1...stickLen {
        print(stick)
    }
}

func isNoTopping(pprTopping: String) -> Bool {
    // 공백문자일때는 토핑이 없는 걸로 판단
    for topping in pprTopping {
        if (topping != " ") {
            return false
        }
    }
    return true
}

func showPepero(pprLen: Int, pprBody: String, pprTopping: String, stickLen: Int) {

    // 빼빼로 몸통 길이가 2이상 일때만 막대기에 끼울 수 있음
    if (pprBody.count >= 2) {

        // 누드 빼뺴로일때 토핑이 있는지 없는지 체크
        if (pprBody == "|0|" && !isNoTopping(pprTopping: pprTopping)) {
            print("누드 빼빼론데 토핑이....?")
        } else {
            // 정보 출력 함수
            showPeperoInform(pprLen: pprLen, pprBody: pprBody, pprTopping: pprTopping, stickLen: stickLen)

            // 몸통 그리는 함수
            drawPeperoBody(pprLen: pprLen, pprBody: pprBody, pprTopping: pprTopping)

            // 막대기 그리는 함수
            drawStick(stickLen: stickLen, pprBodyLength: pprBody.count, pprToppingLength: pprTopping.count)
        }
    }
    else
    {
        print("빼뺴로 몸통이 막대기에 꽂아지질 않네요....")
    }
}

showPepero(pprLen: 6, pprBody: "******", pprTopping: "@@!", stickLen: 4)
