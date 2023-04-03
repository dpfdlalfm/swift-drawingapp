class Rectangle: RandomFigure {
    let size: Size
    let id: RandomId
    let point: RandomPoint
    var color: RandomColor
    var alpha: RandomAlpha
    
    init(size: Size, id: RandomId, point: RandomPoint, color: RandomColor, alpha: RandomAlpha) {
        self.size = size
        self.id = id
        self.point = point
        self.color = color
        self.alpha = alpha
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        return "\(id), \(point), \(size), \(color), \(alpha)"
    }
}

