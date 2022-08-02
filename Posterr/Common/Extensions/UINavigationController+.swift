import Foundation
import UIKit

extension UINavigationController {
    var previousViewController: UIViewController? { viewControllers.last { $0 != topViewController } }
}
