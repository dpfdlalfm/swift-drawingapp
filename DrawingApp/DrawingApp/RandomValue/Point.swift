struct Point {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

extension Point: CustomStringConvertible {
    var description: String {
        return String(format: "X:%.0f, Y:%.0f", x, y)
    }
}
