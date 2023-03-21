import Foundation

struct Pepero {
    let bodyLength: Int
    let bodyStyle: String
    let toping: String
    let stickLength: Int
    let isNude: Bool
    
    // 빼뺴로 초기화
    init(bodyLength: Int,
         bodyStyle: String,
         toping: String,
         stickLength: Int,
         isNude: Bool
    ){
        self.bodyLength = bodyLength
        self.bodyStyle = bodyStyle
        self.toping = (toping.isEmpty) ? " " : toping   // 토핑이 없으면 토핑에 빈칸 하나를 대입한다.
        self.stickLength = stickLength
        self.isNude = isNude
    }
    
    // 빼빼로의 속성을 출력하는 함수
    func printAttribute() -> Void {
        print(
        """
        길이: \(self.bodyLength)
        몸통: \(self.bodyStyle)
        토핑: \(self.toping)
        막대길이: \(self.stickLength)
        """)
    }
    
    // 몸통의 너비를 반환하는 함수
    func myBodyWidth() -> Int{
        return makeBody().count
    }
    
    // 일반 몸통을 한 줄을 만들어 반환하는 함수
    func makeBody() -> String {
        return self.toping + self.bodyStyle + String(self.toping.reversed())
    }
    
    func makeNudeBody() -> String {
        let nudeBody : String   // 몸통이 비어있는 누드빼빼로 문자열
        let middleIndex = self.myBodyWidth() / 2    // 문자열 정중앙 인덱스
        
        if (myBodyWidth() % 2 == 1) {   // 몸통의 길이 홀수이면
            //  누드 빼빼로는 가운데 하나의 빈칸을 갖는다
            nudeBody = self.bodyStyle.prefix(middleIndex - 1) + " " + self.bodyStyle.dropFirst(middleIndex)
        }
        else {  // 짝수이면
            //  누드 빼빼로는 가운데 두개의 빈칸을 갖는다
            nudeBody = self.bodyStyle.prefix(middleIndex - 2) + "  " + self.bodyStyle.dropFirst(middleIndex)
        }
        
        return self.toping + nudeBody + self.toping
    }
    
    // 막대기 한 줄을 만들어 반환하는 함수
    func makeStick() -> String {
        var stick: String   // 반환할 막대기 변수
        let bodyWidth: Int = myBodyWidth()
        
        switch bodyWidth {
        case 3:     // 몸통이 하나의 문자만 갖고 있을 경우
            stick = " | "   // 막대기도 하나의 문자를 갖는다
        case 4:     // 몸통이 두개의 문자를 갖고 있을 경우
            stick = " || "  // 막대기도 중간에 빈칸이 없는 두개의 문자를 갖는다
        default:    // 그 외
            stick = String(repeating: " ", count: bodyWidth / 2 - 1)    // 앞에 (bodyWidth / 2) - 1 개의 빈칸을 갖는다
            if (bodyWidth % 2 == 1) {   // 몸통 너비가 홀수일 경우
                stick += "| |"
            }
            else {                      // 몸통 너비가 짝수일 경우
                 stick += "||"
            }
        }
        
        return stick
    }
    
    // draw pepero's body
    func drawBody() -> Void {
        let body = makeBody()
        let nudeBody = makeNudeBody()
        var i = 0   // 반복문에 들어갈 이터레이터
        
        while (i < bodyLength) { // bodyLength 번 반복
            if (self.isNude == true) {  // 누드 빼빼로면
                print(nudeBody)
                i += 1  // 반복 횟수를 하나 증가시킨다
            }
            
            if (i < bodyLength) {   // 아직 몸통 길이만큼 출력하지 않았으면
                print(body)
                i += 1
            }
        }
    }
    
    //draw pepero's stick
    func drawStick() -> Void {
        let stick = makeStick()
        
        for _ in 0 ..< stickLength { // stickLength 번 반복
            print(stick)
        }
    }
    
    // draw entire pepero
    func drawPepero() {
        drawBody()
        drawStick()
    }
}

// main
// 기본 예시
let example1 = Pepero(bodyLength: 10, bodyStyle: "***", toping: "", stickLength: 4, isNude: false)
let example2 = Pepero(bodyLength: 12, bodyStyle: "***", toping: "&", stickLength: 4, isNude: false)
let example3 = Pepero(bodyLength: 6, bodyStyle: "|0|", toping: "", stickLength: 4, isNude: true)

// 커스텀 빼빼로
let starNudePepero = Pepero(bodyLength: 5, bodyStyle: "|**|", toping: "#", stickLength: 3, isNude: true)
let tooMuchTopingPepero = Pepero(bodyLength: 6, bodyStyle: "||", toping: "!@#$", stickLength: 4, isNude: false)
let smilingPepero = Pepero(bodyLength: 1, bodyStyle: "v", toping: "^", stickLength: 1, isNude: false)

example1.printAttribute()
example1.drawPepero()

example2.printAttribute()
example2.drawPepero()

example3.printAttribute()
example3.drawPepero()

starNudePepero.printAttribute()
starNudePepero.drawPepero()

tooMuchTopingPepero.printAttribute()
tooMuchTopingPepero.drawPepero()

smilingPepero.printAttribute()
smilingPepero.drawPepero()
