struct RandomColor {
    private let red:Int
    let green:Int
    let blue:Int
    
    init() {
        let randomRange = 0..<255
        self.red = Int.random(in: randomRange)
        self.green = Int.random(in: randomRange)
        self.blue = Int.random(in: randomRange)
    }
}