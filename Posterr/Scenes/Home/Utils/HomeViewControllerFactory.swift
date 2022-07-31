import Foundation
import UIKit

enum HomeViewControllerFactory {
    static func make() -> UIViewController & HomeDisplayLogic {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(interactor: interactor)
        presenter.setDisplayLogicDelegate(viewController)

        return viewController
    }
}
