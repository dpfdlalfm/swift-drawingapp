protocol RandomFigureView: CustomStringConvertible {
    var size: Size { get }
    var id: RandomId { get }
    var point: RandomPoint { get }
    var color: RandomColor { get }
    var alpha: RandomAlpha { get }
}

class RectangleView: RandomFigureView {
    let size: Size
    let id: RandomId
    let point: RandomPoint
    let color: RandomColor
    let alpha: RandomAlpha
    
    init(size: Size, id: RandomId, point: RandomPoint, color: RandomColor, alpha: RandomAlpha) {
        self.size = size
        self.id = id
        self.point = point
        self.color = color
        self.alpha = alpha
    }
}

extension RectangleView: CustomStringConvertible {
    var description: String {
        return "\(id), \(point), \(size), \(color), \(alpha)"
    }
}

