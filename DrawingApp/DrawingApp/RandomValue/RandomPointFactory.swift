struct RandomPointFactory {
    private let safeArea: Point
    private let screen: Size
    
    init(safeArea: Point, screen: Size) {
        self.safeArea = safeArea
        self.screen = screen
    }
    
    func create() -> Point {
        let figureWidth: Double = 150
        let rangeOfX = safeArea.x...(screen.width - figureWidth)
        let figureHeight: Double = 120
        let rangeOfY = safeArea.y...(screen.height - figureHeight)
        let pointX = Double.random(in: rangeOfX)
        let pointY = Double.random(in: rangeOfY)
        return Point(x: pointX, y: pointY)
    }
    
}
