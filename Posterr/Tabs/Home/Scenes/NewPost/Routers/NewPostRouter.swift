import Foundation
import UIKit

final class NewPostRouter: NewPostRoutingLogic {
    weak var viewController: UIViewController?

    private var navigationController: UINavigationController? {
        viewController?.navigationController
    }

    func routeToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
