struct Alpha {
    private var alpha: Double
    
    init(alpha: Double) {
        self.alpha = alpha
    }
}

extension Alpha:CustomStringConvertible {
    var description:String {
        return "Alpha: \(alpha)"
    }
}
