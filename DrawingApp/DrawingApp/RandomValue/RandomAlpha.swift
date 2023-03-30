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
    var alpha: Double
    
    init() {
        let allAlphaCases = Alpha.allCases
        let randomIndex = Int.random(in: 0..<allAlphaCases.count)
        let randomAlphaValue = allAlphaCases[randomIndex].rawValue
        let divideNumber: Double = 10
        self.alpha = randomAlphaValue / divideNumber
    }
}

extension RandomAlpha:CustomStringConvertible {
    var description:String {
        return "Alpha: \(alpha)"
    }
}
