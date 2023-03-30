import UIKit
import OSLog

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        let safeAreaPoint = getSafeAreaPoint()
        let screenSize = getScreenSize()
        let factory = RectangleViewFactory(deviceSafeArea: safeAreaPoint, deviceScreen: screenSize)
        
        let makeCount:Int = 4
        for i in 1...makeCount {
            let RectangleView = factory.makeView()
            let logger = Logger(subsystem: "com.inwoo.DrawingApp", category: "ViewController")
            logger.log("Rect\(i) \(RectangleView.description)")
        }
    }
    
    func getSafeAreaPoint() -> Point {
        let safeAreaPointX = Double(self.view.layoutMargins.top)
        let safeAreaPointY = Double(self.view.layoutMargins.bottom)
        return Point(x: safeAreaPointX, y: safeAreaPointY)
    }
    
    func getScreenSize() -> Size {
        let screenWidth = Double(UIScreen.main.bounds.width)
        let screenHeight = Double(UIScreen.main.bounds.height)
        return Size(width: screenWidth, height: screenHeight)
    }
}
