//
//  main.swift
//  cuk-lion-subject1
//
//  Created by 김희은 on 2023/03/16.
//

/*
 추가 기능 구현
    <drawStick 함수부>
    너비에 따른 공백 추가를 위해 매개변수 body 추가
    너비가 1인 빼빼로의 경우엔 막대를 "|"로 구현
 */


// 길이에 따른 막대를 그리는 함수
func drawStick(stickLen:Int, body:String) {
    // 너비에 따른 공백 추가를 위한 함수
    let length:Int = body.count - 2

    // 막대 출력부분 : |(공백)|
    for _ in 0..<stickLen {
        
        print(" |", terminator: "")

        if (0<=length){ // 몸통의 너비가 2 이상인 경우
            for _ in 0..<length {
                // 너비에 다른 공백 추가 반복문
                print(" ", terminator: "");
            }
            
            print("|")
        }
        else { // 몸통의 너비가 1이하일 경우
            print()
        }
    }
    
}

// 몸통(String), 토핑(String) 을 매개변수로 받아 토핑과 몸통을 그리는 함수
func whatHead(body: String, topping: String = " "){
    // topping을 추가한 빼뺴로헤드 추가
    print("\(topping)\(body)\(topping)")
}

// 길이(Int)에 따라 몸통을 그리는 함수
func drawHead(headLen: Int, body: String, topping: String = " "){
    
    // 누드빼빼로 여부 판별 조건문
    
    // 누드빼빼로일 때
    if (body == "|0|"){
        for _ in 0..<(headLen/2) {
            // 사이가 빈 빼빼로 출력
            print("\(topping)| |\(topping)")
            // |0| 부분 출력
            whatHead(body: body, topping: topping)
        }
    }
    // 누드빼빼로가 아닐 때
    else {
        for _ in 0..<headLen {
            whatHead(body:body, topping:topping)
        }
    }
}

//reapeatHead, headLen -> 변경


// 각종 매개변수를 받아 위의 세 메서드를 호출하는 함수
func drawBBR(headLen: Int, body: String, stickLen: Int, topping: String = " ") {
    print("<정보>\n길이: \(headLen)\n몸통: \(body)\n토핑: \(topping)\n막대길이: \(stickLen)\n")
    drawHead(headLen:headLen, body:body, topping:topping)
    drawStick(stickLen:stickLen, body:body)
    print("\n")
}


drawBBR(headLen: 10, body: "***", stickLen: 4)

drawBBR(headLen: 12, body: "***", stickLen: 4, topping: "&")

drawBBR(headLen: 6, body: "|0|", stickLen: 4)

drawBBR(headLen: 6, body: "**", stickLen: 4)

drawBBR(headLen: 6, body: "**", stickLen: 4, topping: "+")

drawBBR(headLen: 6, body: "****", stickLen: 2)

drawBBR(headLen: 6, body: "*", stickLen: 2)

