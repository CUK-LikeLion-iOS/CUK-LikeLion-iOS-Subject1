import Foundation

func inFormation (length : Int, body : String, topping : String, stick : Int) //  정보를 출력하는 함수
{
           print("""
                <정보>
                길이: \(length)
                몸통: \(body)
                토핑: \(topping)
                막대길이: \(stick)
                """)
}

func drawBody(body : String, topping : String) -> String
{
    let reTopping = topping.reversed() // 뒤는 앞 토핑과 대칭을 이루어야 하기 때문에 reverse 처리

    if topping.count == 0 // 토핑이 만약 없다면 공백을 추가해주고 예외로는 topping을 양 옆에 추가해서 body 를 만들어준다.
    { return " " + body + " " }
    else
    { return topping + body + reTopping}
}

func drawStick(topLength :Int , stick : Int, body : Int) // 토핑 길이에 따라서 시작지점 공백 바뀐다.
{
    var bodySpace = "" // 몸통 사이의 거리를 위한 공백
    var toppingSpace = "" // 토핑으로 인해서 생기는 공백

    if topLength == 0 // 토핑이 0 일때는 공백 하나만 만들어주고
    {
        toppingSpace = " "
    }
    else { // 그 외의 경우일때는 토핑의 수 만큼 공백을 만들어준다.
        for _ in 0..<topLength
        {
            toppingSpace += " "
        }
    }
    
    // 몸통의 길이에서 2를 뺀 길이가 막대사이의 공백이다.
    for _ in 2..<body
    {
        bodySpace += " "
    }

    // 토핑으로인한 공백과 몸통사이의 공백을 합쳐 막대를 만들어줌
    for _ in 0..<stick
    {
        print(toppingSpace+"|"+bodySpace+"|"+toppingSpace)
    }
    
}

func drawPepero(length : Int , body : String ) // 입력받은 길이만큼 Body 를 반복
{
    for _ in 0..<length
    {
        print(body)
    }
}

func makePepero (length : Int, body : String , topping : String, stick : Int)
{
    if body.count < 2 // 몸통이 2개가 안되면 막대를 꽂을수 없다.
    {
        print("막대를 꽂을 공간이 없어요 ! 몸통을 2개이상 입력해주세요. ")
    }
    else {
        drawPepero(length: length, body: drawBody(body: body, topping: topping)) // body 에는 drawbody 가 body 를 반환하기 때문에 drawBody 를 반환해준다.
        drawStick(topLength : topping.count , stick:stick ,body :body.count) // 입력받아서 출력
    }
}

inFormation(length: 10, body: "***", topping: "", stick: 4)
makePepero(length: 10, body: "***", topping: "", stick: 4)
inFormation(length: 12, body: "***", topping: "&", stick: 4)
makePepero(length: 12, body: "***", topping: "&", stick: 4)
inFormation(length: 6, body: "|0|", topping: "", stick: 4)
makePepero(length: 6, body: "|0|", topping: "", stick: 4)
inFormation(length: 6, body: "****", topping: "&^#", stick: 4)
makePepero(length: 6, body: "****", topping: "&^#", stick: 4)
inFormation(length: 6, body: "*", topping: "&^#", stick: 4)
makePepero(length: 6, body: "*", topping: "&^#", stick: 4)
