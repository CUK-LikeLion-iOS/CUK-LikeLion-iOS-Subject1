
import Foundation
print("<정보>")
print("길이:",terminator: " ")
let length = Int(readLine()!)!
print("몸통:",terminator: " ")
let body = inPutStr()
print("토핑:",terminator: " ")
let topping = inPutStr()
print("막대길이:",terminator: " ")
let n = Int(readLine()!)!
let toplength = topping.count
let bodylength = body.count
var ss = drawBody(a: topping, b: body)
func inPutStr () -> String {
    guard let str = readLine() else {
        return " "
    }
    return str
}
func drawBody (a: String , b: String) -> String
{
    return a+b+a
}
func draw (str : String ,len : Int)
{
    for _ in 0..<len {
        print(str)
    }
    
}
func drawStick(toplength :Int , stick : Int, body : Int) // 토핑 길이에 따라서 시작지점 공백 바뀐다.
{
    var bodyspace = ""
    for _ in 2..<body
    {
        bodyspace += " "
    }
    var space = ""
    for _ in 0..<toplength
    {
        space += " "
    }
    for _ in 0..<stick
    {
        print(space+"|"+bodyspace+"|")
    }

}
draw(str:ss,len:length)
drawStick(toplength:toplength, stick:n,body : bodylength)



