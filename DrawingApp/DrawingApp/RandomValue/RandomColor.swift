struct RandomColor {
    let red:Int
    let green:Int
    let blue:Int
    
    init() {
        let randomRange = 0..<255
        self.red = Int.random(in: randomRange)
        self.green = Int.random(in: randomRange)
        self.blue = Int.random(in: randomRange)
    }
}

extension RandomColor: CustomStringConvertible {
    var description: String {
        return "R:\(red), G:\(green), B:\(blue)"
    }
}
