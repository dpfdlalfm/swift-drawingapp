struct Point {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

struct RandomPoint {
    let x: Double
    let y: Double
    
    init(deviceSafeArea: Point, screenSize: Size) {
        let FigureViewWidth: Double = 150
        let rangeOfX = deviceSafeArea.x...(screenSize.width - FigureViewWidth)
        let FigureViewHeight: Double = 120
        let rangeOfY = deviceSafeArea.y...(screenSize.height - FigureViewHeight)
        self.x = Double.random(in: rangeOfX)
        self.y = Double.random(in: rangeOfY)
    }
}

extension RandomPoint: CustomStringConvertible {
    var description: String {
        return String(format: "X:%.0f, Y:%.0f", x, y)
    }
}
