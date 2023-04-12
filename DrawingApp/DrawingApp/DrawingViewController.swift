import UIKit
import OSLog

class DrawingViewController: UIViewController {
    var tapGestureRecognizer = UITapGestureRecognizer()
    var rectangleFactory: RectangleFactory?
    var plane = Plane()
    var selectedView:[UIView] = []
    var figureViews: Dictionary<Id, UIView> = [:]
    var logger: Logger = Logger(subsystem: "com.inwoo.DrawingApp", category: "ViewController")
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var figureInsperctorView: UIView!
    @IBOutlet weak var figureInspectorHideButton: UIButton!
    @IBOutlet weak var colorChanger: UIButton!
    @IBOutlet weak var rectangleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        figureInspectorHideButton.layer.cornerRadius = CGFloat(15)
        rectangleButton.layer.cornerRadius = 40
        rectangleButton.layer.cornerCurve = .continuous
        colorChanger.layer.borderWidth = 2
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

        // Plane에서 mutating 키워드를 사용하여 추가하는 대신 클로저를 이용하여 구현했습니다.
        // 근거는 클로저로 해당 기능을 구현했을 때, plane구조체의 주소값이 바뀌지 않는 장점이 있었기 때문입니다.
        let closure = { (rectangle: Rectangle) in
            self.plane.rectangles += [rectangle]
        }
        closure(rectangle)
        
        let rectangleView = converToView(by: rectangle)
        self.figureViews[rectangle.id] = rectangleView
            
        self.view.addSubview(rectangleView)
        self.view.bringSubviewToFront(sender)
    }
    
    @IBAction func hideInspector(_ sender: Any) {
        
    }
    
    @IBAction func isValuechanged(_ sender: UISlider) {
        let value = sender.value
        if !selectedView.isEmpty {
            selectedView.forEach {
                $0.alpha = CGFloat(value)
            }
        }
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        guard let tappedPoint = plane.isExist(in: sender.location(in: self.view)) else {
            // 존재하지 않으면 선택 취소
            selectedView.forEach {
                $0.layer.borderWidth = 0
            }
            selectedView.removeAll()
            return
        }
        
        guard let rectangleView = self.view.hitTest(tappedPoint, with: nil) else {
            return
        }
        
        rectangleView.layer.borderWidth = 2
        rectangleView.layer.borderColor = UIColor.blue.cgColor
        selectedView.append(rectangleView)
    }
}

extension DrawingViewController {
    private func converToView(by rectangle: Rectangle) -> UIView {
        let rectangleView = UIView(
            frame: CGRect(x: rectangle.point.x,
                          y: rectangle.point.y,
                          width: rectangle.size.width,
                          height: rectangle.size.height))
        rectangleView.backgroundColor = convertToUIColor(by: rectangle.color,
                                                   with: rectangle.alpha)
        return rectangleView
    }
    
    // Color를 UIColor로 변경하여 return 하는 메소드
    private func convertToUIColor(by color: Color, with alpha: Alpha) -> UIColor {
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
