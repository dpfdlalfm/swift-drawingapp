import UIKit
import OSLog

class DrawingViewController: UIViewController {
    var tapGestureRecognizer = UITapGestureRecognizer()
    var rectangleFactory: RectangleFactory?
    var plane = Plane()
    var selectedView:[UIView] = []
    var figureViews: Dictionary<Id, UIView> = [:]
    var logger: Logger = Logger(subsystem: "com.inwoo.DrawingApp", category: "ViewController")
    
    @IBOutlet weak var figureInsperctorView: UIView!
    @IBOutlet weak var figureInspectorHideButton: UIButton!
    @IBOutlet weak var rectangleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        figureInspectorHideButton.layer.cornerRadius = CGFloat(15)
        rectangleButton.layer.cornerRadius = 40
        rectangleButton.layer.cornerCurve = .continuous
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
    
    @IBAction func createRectangleView(_ sender: UIButton) {
        guard let rectangle = rectangleFactory?.create() else { return }
        
        let rectangleView = UIView(
            frame:CGRect(x: rectangle.point.x,
                         y: rectangle.point.y,
                         width: rectangle.size.width,
                         height: rectangle.size.height))
        rectangleView.backgroundColor = getUIColor(by: rectangle.color, with: rectangle.alpha)
        self.view.addSubview(rectangleView)
        
        // Plane에서 mutating 키워드를 사용하여 추가하는 대신 클로저를 이용하여 구현했습니다.
        // 근거는 클로저로 해당 기능을 구현했을 때, plane구조체의 주소값이 바뀌지 않는 장점이 있었기 때문입니다.
        let closure = { (rectangle: Rectangle, level: Int) in
            self.plane.rectangles += [(rectangle, level)]
        }
        guard let level = self.view.subviews.firstIndex(of: rectangleView) else {
            return
        }
        closure(rectangle, level)
        
        self.figureViews[rectangle.id] = rectangleView
        view.bringSubviewToFront(sender)
    }
    
    @IBAction func hideInspector(_ sender: Any) {
        
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        guard let rectangle = plane.isExist(in: sender.location(in: self.view)) else {
            selectedView.forEach {
                $0.layer.borderWidth = 0
            }
            selectedView.removeAll()
            return
        }
        
        if let rectangleView = figureViews[rectangle.id] {
            rectangleView.layer.borderWidth = 5
            rectangleView.layer.borderColor = UIColor.blue.cgColor
            selectedView.append(rectangleView)
        }
    }
}

extension DrawingViewController {
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
