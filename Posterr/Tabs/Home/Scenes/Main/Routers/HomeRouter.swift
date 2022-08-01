import Foundation
import UIKit

final class HomeRouter: HomeRoutingLogic {
    weak var viewController: UIViewController?

    private var navigationController: UINavigationController? {
        viewController?.navigationController
    }

    func routeToNewPost() {
        navigationController?.pushViewController(
            NewPostViewControllerFactory.make(),
            animated: true)
    }
}
