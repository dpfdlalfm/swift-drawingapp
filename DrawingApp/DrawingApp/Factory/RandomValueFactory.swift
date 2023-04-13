import Foundation

struct RandomValueFactory {
    private let safeArea: Point
    private let screen: Size
    
    init(safeArea: Point, screen: Size) {
        self.safeArea = safeArea
        self.screen = screen
    }
    
    func createId() -> Id {
        var uuid = UUID().uuidString.suffix(9)
        let thirdIndex = uuid.index(uuid.startIndex, offsetBy: 3)
        uuid.insert("-", at: thirdIndex)
        let sixthIndex = uuid.index(thirdIndex, offsetBy: 4)
        uuid.insert("-", at: sixthIndex)
        return Id(id: String(uuid))
    }
    
    func createPoint() -> Point {
        let figureWidth: Double = 150
        let rangeOfX = safeArea.x...(screen.width - figureWidth)
        let figureHeight: Double = 120
        let rangeOfY = safeArea.y...(screen.height - figureHeight)
        let pointX = Double.random(in: rangeOfX)
        let pointY = Double.random(in: rangeOfY)
        return Point(x: pointX, y: pointY)
    }
    
    func createAlpha() -> Alpha {
        let allAlphaCases = Alpha.allCases
        let randomIndex = Int.random(in: 0..<allAlphaCases.count)
        let randomAlpha = allAlphaCases[randomIndex]
        return randomAlpha
    }
}
