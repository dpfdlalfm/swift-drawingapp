import Foundation

protocol ModelView {
    var size:Size { get }
    var id:String { get }
    var point:Point { get }
    var color:Color { get }
    var alpha:Double { get }
}

class RandomViewFactory {
    // TODO: - 1. lazy var로 처리했는데 정확한 사용법 및 장단점 분석
    // TODO: - 2. Size, Point 구조체 private 선언자 삽입 가능한지
    let size = Size(width: 150, height: 120)
    // init으로 받도록 변경한 이유는 어차피 하나의 장치 내에서 사용하므로
    // safeArea는 한번만 초기화 하면 이후에는 계속 재사용이 더 효율적이라 판단함
    private let deviceSafeArea:Point
    private let deviceScreen:Size
    
    func makeView() -> ModelView {
        let id = setID()
        let point = setPoint()
        let color = setColor()
        let alpha = setAlpha()
        return RectangleView(id, size, point, color, alpha)
    }
    
    init(deviceSafeAreaPoint: Point, deviceScreenSize: Size) {
        self.deviceSafeArea = deviceSafeAreaPoint
        self.deviceScreen = deviceScreenSize
    }
    
    func setPoint() -> Point {
        let randomRangeOfX = deviceSafeArea.x...(deviceScreen.width - size.width)
        let randomRangeOfY = deviceSafeArea.y...(deviceScreen.height - size.height)
        return Point(x: Double.random(in: randomRangeOfX),
                     y: Double.random(in: randomRangeOfY))
    }
    
    func setID() -> String {
        // TODO: - 3. id가 안겹치게 하는 방지 시스템도 따로 추가해야 할까
        var id = UUID().uuidString.suffix(9)
        let thirdIndex = id.index(id.startIndex, offsetBy: 2)
        id.insert("-", at: thirdIndex)
        let sixthIndex = id.index(id.startIndex, offsetBy: 6)
        id.insert("-", at: sixthIndex)
        return String(id)
    }
    
    func setColor() -> Color {
        let randomRange = 0..<255
        let randomRed = Int.random(in: randomRange)
        let randomGreen = Int.random(in: randomRange)
        let randomBlue = Int.random(in: randomRange)
        return Color(r: randomRed, g: randomGreen, b: randomBlue)
    }
    
    func setAlpha() -> Double {
        let index = Int.random(in: 0..<Alpha.allCases.count)
        let alpha = Alpha.allCases[index].rawValue
        let divideNumber:Double = 10
        return alpha / divideNumber
    }
}

class RectangleView:ModelView {
    let size: Size
    let id: String
    let point: Point
    let color: Color
    let alpha: Double
    
    init(_ id: String,_ size: Size, _ point: Point, _ color: Color, _ alpha: Double) {
        self.id = id
        self.size = size
        self.point = point
        self.color = color
        self.alpha = alpha
    }
}

// Point, Size, Color, Alpha를 nested Type이 아닌 외부 선언 이유는
// 추후에 사각형 뷰 뿐만 아니라 원이나 삼각형 모양 뷰를 만드는 팩토리를 구현할 때 이용하기 위함
struct Point {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

struct Size {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

struct Color {
    private let r:Int
    private let g:Int
    private let b:Int
    
    init(r: Int, g: Int, b: Int) {
        self.r = r
        self.g = g
        self.b = b
    }
}

enum Alpha: Double, CaseIterable {
    case one = 1,
         two,
         three,
         four,
         five,
         six,
         seven,
         eight,
         nine,
         ten
}
