import Foundation

class RectangleFactory: RandomFigureFactory {
    let idFactory: RandomIdFactory
    let colorFactory: RandomColorFactory
    let pointFactory: RandomPointFactory
    let alphaFactory: RandomAlphaFactory
    
    init(deviceSafeArea: Point, deviceScreenSize: Size) {
        idFactory = RandomIdFactory()
        colorFactory = RandomColorFactory()
        pointFactory = RandomPointFactory(safeArea: deviceSafeArea, screen: deviceScreenSize)
        alphaFactory = RandomAlphaFactory()
    }
    
    func create() -> RandomFigure {
        let size = Size(width: 150, height: 120)
        let id = idFactory.create()
        let point = pointFactory.create()
        let color = colorFactory.create()
        let alpha = alphaFactory.create()
        return Rectangle(size: size, id: id, point: point, color: color, alpha: alpha)
    }
}
