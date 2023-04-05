class RectangleFactory: RandomFigureFactory {
    private let propertyFactory: RandomValueFactory
    
    init(deviceSafeArea: Point, deviceScreenSize: Size) {
        propertyFactory = RandomValueFactory( safeArea: deviceSafeArea,
                                              screen: deviceScreenSize )
    }
    
    func create() -> Figure {
        let size = Size(width: 150, height: 120)
        let id = propertyFactory.createId()
        let point = propertyFactory.createPoint()
        let color = propertyFactory.createColor()
        let alpha = propertyFactory.createAlpha()
        return Rectangle(size: size, id: id, point: point, color: color, alpha: alpha)
    }
}
