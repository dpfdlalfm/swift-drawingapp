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
        let requirementWidth: Double = 150
        let rangeOfX = deviceSafeArea.x...(screenSize.width - requirementWidth)
        let requirementHeight: Double = 120
        let rangeOfY = deviceSafeArea.y...(screenSize.height - requirementHeight)
        self.x = Double.random(in: rangeOfX)
        self.y = Double.random(in: rangeOfY)
    }
}
