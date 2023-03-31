protocol RandomFigureView: CustomStringConvertible {
    var size: Size { get }
    var id: RandomId { get }
    var point: RandomPoint { get }
    var color: RandomColor { get set }
    var alpha: RandomAlpha { get set }
}
