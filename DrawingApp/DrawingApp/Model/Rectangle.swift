class Rectangle: Figure {
    let size: Size
    let id: Id
    let point: Point
    var color: Color
    var alpha: Alpha
    
    init(size: Size, id: Id, point: Point, color: Color, alpha: Alpha) {
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
