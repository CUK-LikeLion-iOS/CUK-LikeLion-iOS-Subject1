import Foundation

func printStick(stickLength : Int, bodyWidth : Int) -> Void {
    var stick : String
    switch bodyWidth {
    case 1:
        stick = "|"
    case 2:
        stick = "||"
    default:
        stick = String(repeating: " ", count: bodyWidth / 2 - 1)
        if (bodyWidth % 2 == 1) {
            stick += "| |"
        }
        else {
             stick += "||"
        }
    }
    for _ in 0..<stickLength {
        print(stick)
    }
}

func printBody(bodyLength : Int, body : String) -> Void {
    for _ in 0..<bodyLength {
        print(body)
    }
}

func makeBody(body : String, toping : String) -> String {
    return toping + body + toping
}

func makePepero(body : String, toping : String, stickLength : Int, bodyLength : Int) -> Void {
    let mergedBody = makeBody(body: body, toping: toping)
    printBody(bodyLength: bodyLength, body: mergedBody)
    printStick(stickLength: stickLength, bodyWidth: mergedBody.count)
}


// main
let
bodyLength : Int,
body : String,
toping : String,
stickLength : Int

print("<정보>")
print("길이: ", terminator: "")
bodyLength = Int(readLine()!)!
print("몸통: ", terminator: "")
body = readLine()!
print("토핑: ", terminator: "")
toping = readLine()!
print("막대길이: ", terminator: "")
stickLength = Int(readLine()!)!

makePepero(body: body, toping: toping, stickLength: stickLength, bodyLength: bodyLength)
