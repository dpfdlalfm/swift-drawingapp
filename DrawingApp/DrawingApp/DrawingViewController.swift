import UIKit
import OSLog

class DrawingViewController: UIViewController {
    var rectangleFactory:RectangleFactory?
    var logger:Logger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard logger == nil else {
            return
        }
        logger = Logger(subsystem: "com.inwoo.DrawingApp", category: "ViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if rectangleFactory == nil {
            let safeAreaPoint = getSafeAreaPoint()
            let screenSize = getScreenSize()
            rectangleFactory = RectangleFactory(deviceSafeArea: safeAreaPoint, deviceScreenSize: screenSize)
        }
        
        let makeCount:Int = 4
        for i in 1...makeCount {
            guard let rectangle = rectangleFactory?.create() else {
                return
            }
            logger?.log("Rect\(i) \(rectangle.description)")
        }
    }
    
    private func getSafeAreaPoint() -> Point {
        let safeAreaPointX = Double(self.view.layoutMargins.top)
        let safeAreaPointY = Double(self.view.layoutMargins.bottom)
        return Point(x: safeAreaPointX, y: safeAreaPointY)
    }
    
    private func getScreenSize() -> Size {
        let screenWidth = Double(UIScreen.main.bounds.width)
        let screenHeight = Double(UIScreen.main.bounds.height)
        return Size(width: screenWidth, height: screenHeight)
    }
}
