import Foundation
import UIKit

enum ProfileViewControllerFactory {
    static func make() -> UIViewController & ProfileDisplayLogic {
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor(presenter: presenter)
        let viewController = ProfileViewController(interactor: interactor)
        presenter.setDisplayLogicDelegate(viewController)

        return viewController
    }
}
