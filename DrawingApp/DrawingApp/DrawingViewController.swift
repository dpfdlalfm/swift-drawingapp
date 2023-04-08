import UIKit
import OSLog

class DrawingViewController: UIViewController, UIGestureRecognizerDelegate {
    let tapGestureRecognizer = UITapGestureRecognizer()
    var rectangleFactory: RectangleFactory?
    var plane = Plane()
    var figureViews: Dictionary<Id, UIView> = [:]
    var logger: Logger?
    
    @IBOutlet weak var figureInsperctorView: UIView!
    @IBOutlet weak var figureInspectorHideButton: UIButton!
    @IBOutlet weak var rectangleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer.delegate = self
        
        figureInspectorHideButton.layer.cornerRadius = CGFloat(15)
        rectangleButton.layer.cornerRadius = 40
        rectangleButton.layer.cornerCurve = .continuous
        
        guard logger == nil else {
            return
        }
        logger = Logger(subsystem: "com.inwoo.DrawingApp", category: "ViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if rectangleFactory == nil {
            let safeAreaPoint = getSafeAreaPoint()
            guard let screenSize = getScreenSize() else {
                return
            }
            rectangleFactory = RectangleFactory(deviceSafeArea: safeAreaPoint, deviceScreenSize: screenSize)
        }
    }
    
    @IBAction func createRectangle(_ sender: Any) {
        guard let rectangle = rectangleFactory?.create() else { return }
        
        let rectangleView = UIView(
            frame:CGRect(x: rectangle.point.x,
                         y: rectangle.point.y,
                         width: rectangle.size.width,
                         height: rectangle.size.height))
        rectangleView.backgroundColor = getUIColor(by: rectangle.color, with: rectangle.alpha)
        rectangleView.addGestureRecognizer(tapGestureRecognizer)
        
        guard let level = self.view.subviews.firstIndex(of: rectangleView) else {
            return
        }
        
        let closure = { (rectangle: Rectangle, level: Int) in
            self.plane.rectangles += [(rectangle, level)]
        }
        closure(rectangle, level)
        
        self.figureViews[rectangle.id] = rectangleView
        self.view.addSubview(rectangleView)
    }
    
    @IBAction func hideInspector(_ sender: Any) {
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    // Color를 UIColor로 변경하여 return 하는 메소드
    private func getUIColor(by color: Color, with alpha: Alpha) -> UIColor {
        let rgbMaxValue = 255.0
        let red = CGFloat(color.red / rgbMaxValue)
        let green = CGFloat(color.green / rgbMaxValue)
        let blue = CGFloat(color.blue / rgbMaxValue)
        let alphaMaxValue = 10.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha.rawValue / alphaMaxValue)
        return color
    }

    private func getSafeAreaPoint() -> Point {
        let safeAreaPointX = Double(self.view.layoutMargins.top)
        let safeAreaPointY = Double(self.view.layoutMargins.bottom)
        return Point(x: safeAreaPointX, y: safeAreaPointY)
    }
    
    private func getScreenSize() -> Size? {
        guard let screenBounds = self.view.window?.windowScene?.screen.bounds else {
            return nil
        }
        let screenWidth = screenBounds.size.width
        let screenHeight = screenBounds.size.height
        return Size(width: screenWidth, height: screenHeight)
    }
}
