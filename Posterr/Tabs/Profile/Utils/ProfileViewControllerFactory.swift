import Foundation
import UIKit

enum ProfileViewControllerFactory {
    static func make(postDataStore: PostDataStore) -> UIViewController & ProfileDisplayLogic {
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor(presenter: presenter, postDataStore: postDataStore)
        let viewController = ProfileViewController(interactor: interactor)
        presenter.displayLogicDelegate = viewController

        return viewController
    }
}
