import Foundation
import UIKit

enum HomeViewControllerFactory {
    static func make() -> UIViewController & HomeDisplayLogic {
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(interactor: interactor, router: router)
        presenter.displayLogicDelegate = viewController
        router.viewController = viewController

        return viewController
    }
}
