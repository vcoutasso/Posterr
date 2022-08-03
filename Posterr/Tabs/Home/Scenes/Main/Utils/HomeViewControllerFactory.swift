import Foundation
import UIKit

enum HomeViewControllerFactory {
    static func make() -> UIViewController & HomeDisplayLogic {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(dataStore: interactor)
        let adapter = PostTableViewAdapter<HomeViewController>()
        let viewController = HomeViewController(interactor: interactor, router: router, tableAdapter: adapter)
        presenter.displayLogicDelegate = viewController
        router.viewController = viewController

        return viewController
    }
}
