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

struct RandomAlpha {
    let alpha: Double
    
    init() {
        guard let randomAlphaValue = Alpha.allCases.randomElement() else {
            return
        }
        let divideNumber: Double = 10
        self.alpha = randomAlphaValue.rawValue / divideNumber
    }
}
