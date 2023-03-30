import Foundation

protocol RandomViewFactory {
    init(deviceSafeArea: Point, deviceScreen: Size)
    func makeView() -> RandomFigureView
}

class RectangleViewFactory: RandomViewFactory {
    // init으로 받도록 변경한 이유는 어차피 하나의 장치 내에서 사용하므로
    // safeArea는 한번만 초기화 하면 이후에는 계속 재사용이 더 효율적이라 판단함
    private let deviceSafeArea: Point
    private let deviceScreen:Size
    
    required init(deviceSafeArea: Point, deviceScreen: Size) {
        self.deviceSafeArea = deviceSafeArea
        self.deviceScreen = deviceScreen
    }
    
    func makeView() -> RandomFigureView {
        let size = Size(width: 150, height: 120)
        let id = RandomId()
        let point = RandomPoint(deviceSafeArea: deviceSafeArea, screenSize: deviceScreen)
        let color = RandomColor()
        let alpha = RandomAlpha()
        return RectangleView(size: size, id: id, point: point, color: color, alpha: alpha)
    }
}
