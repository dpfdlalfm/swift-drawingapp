struct RandomAlphaFactory {
    func create() -> Alpha {
        let allAlphaCases = Alpha.allCases
        let randomIndex = Int.random(in: 0..<allAlphaCases.count)
        let randomAlpha = allAlphaCases[randomIndex]
        return randomAlpha
    }
}
