class RectangleFactory: FigureFactory {
    typealias Figure = Rectangle
    private let randomPropertyFactory: RandomValueFactory
    
    init(deviceSafeArea: Point, deviceScreenSize: Size) {
        randomPropertyFactory = RandomValueFactory( safeArea: deviceSafeArea,
                                              screen: deviceScreenSize )
    }
    
    func create() -> Rectangle {
        let size = Size(width: 150, height: 120)
        let id = randomPropertyFactory.createId()
        let point = randomPropertyFactory.createPoint()
        let color = randomPropertyFactory.createColor()
        let alpha = randomPropertyFactory.createAlpha()
        return Rectangle(size: size, id: id, point: point, color: color, alpha: alpha)
    }
}
