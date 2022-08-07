import Foundation
import UIKit

enum HomeViewControllerFactory {
    static func make(postDataStore: PostDataStore) -> UIViewController & HomeDisplayLogic {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter, postDataStore: postDataStore)
        let router = HomeRouter(dataStore: interactor)
        let viewController = HomeViewController(interactor: interactor, router: router)
        presenter.displayLogicDelegate = viewController
        router.viewController = viewController

        return viewController
    }
}
