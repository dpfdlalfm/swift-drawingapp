import UIKit
import OSLog

class DrawingViewController: UIViewController {
    var rectangleFactory:RectangleFactory?
    var logger:Logger?
    @IBOutlet weak var figureInsperctorView: UIView!
    @IBOutlet weak var figureInspectorHideButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let darkGray = UIColor(cgColor: CGColor(gray: 33,
            alpha: 1))
        figureInspectorHideButton.backgroundColor = darkGray
        let lightGray = UIColor(cgColor: CGColor(gray: 67,
            alpha: 1))
        figureInspectorHideButton.tintColor = lightGray
        
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
    
    @IBAction func didTapHideButton(_ sender: Any) {
        
    }

    private func color(view: UIView, to color: Color, with alpha: Alpha) {
        let red = CGFloat(color.red)
        let green = CGFloat(color.green)
        let blue = CGFloat(color.blue)
        let color = CGColor(red: red, green: green, blue: blue, alpha: alpha.rawValue)
        view.backgroundColor = UIColor(cgColor: color)
    }
    
    private func getSafeAreaPoint() -> Point {
        let safeAreaPointX = Double(self.view.layoutMargins.top)
        let safeAreaPointY = Double(self.view.layoutMargins.bottom)
        return Point(x: safeAreaPointX, y: safeAreaPointY)
    }
    
    private func getScreenSize() -> Size {
        let screenWidth = Double(UIScreen.main.bounds.size.width)
        let screenHeight = Double(UIScreen.main.bounds.size.height)
        return Size(width: screenWidth, height: screenHeight)
    }
}
