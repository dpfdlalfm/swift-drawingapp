struct Size {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

extension Size {
    var description: String {
        return "W\(width), H\(height)"
    }
}
