struct RandomAlphaFactory {
    enum AlphaPhase: Double, CaseIterable {
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
    
    func create() -> Alpha {
        let allAlphaCases = AlphaPhase.allCases
        let randomIndex = Int.random(in: 0..<allAlphaCases.count)
        let randomAlphaValue = allAlphaCases[randomIndex].rawValue
        let divideNumber: Double = 10
        return Alpha(alpha: randomAlphaValue / divideNumber)
    }
}
