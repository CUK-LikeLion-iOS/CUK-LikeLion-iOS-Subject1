//
//  main.swift
//  cuk-lion-subject1
//
//  Created by 김희은 on 2023/03/16.
//
   
/*
 수정 완료
 토핑 길이에 따른 공백 제작 추가
 */

func drawStick(stickLen:Int, body:String, topping:String = " ") {
    let bodyWidth:Int = body.count - 2
    let makeGap:Int = topping.count
    
    for _ in 0..<stickLen {
        
        // 토핑 길이에 따른 공백 제작
        if makeGap > 0 {
            for _ in 0 ..< makeGap {
                print(" ", terminator: "")
            }
        }
        
        print("|", terminator: "")
        
        // 몸통의 너비에 따른 공백 제작
        if (0 <= bodyWidth){
            for _ in 0..<bodyWidth {
                print(" ", terminator: "");
            }
            print("|")
        }
        else {
            print()
        }
    }
    print()
}

func printHead(body: String, topping: String = " "){
    print("\(topping)\(body)\(topping)")
}

func drawHead(headLen: Int, body: String, topping: String = " "){
    //var countLen = headLen
    
    // 누드빼빼로일 경우
    if (body == "|0|"){
        for i in 0..<headLen {
            if (i%2 == 0) {
                print("\(topping)| |\(topping)")
            }
            else {
                printHead(body: body, topping: topping)
            }
            //countLen = countLen - 1
        }
    }
    
    // 누드빼빼로가 아닐 경우
    else {
        for _ in 0..<headLen {
            printHead(body:body, topping:topping)
        }
    }
    
}

func drawBBR(headLen: Int, body: String, stickLen: Int, topping: String = " ") {
    print("<정보>\n길이: \(headLen)\n몸통: \(body)\n토핑: \(topping)\n막대길이: \(stickLen)\n")
    
    if stickLen == 0 || body == "" {
        print("error : 빼빼로를 만들 수 없습니다.\n")
    }
    else {
        drawHead(headLen:headLen, body:body, topping:topping)
        drawStick(stickLen:stickLen, body:body, topping:topping)
    }
}


drawBBR(headLen: 6, body: "***", stickLen: 3)

drawBBR(headLen: 6, body: "****", stickLen: 4, topping: "&&")

drawBBR(headLen: 5, body: "|0|", stickLen: 4)

drawBBR(headLen: 6, body: "**", stickLen: 4)

drawBBR(headLen: 6, body: "*", stickLen: 2)

drawBBR(headLen: 6, body: "**", stickLen: 0)

drawBBR(headLen: 6, body: "", stickLen: 0)

