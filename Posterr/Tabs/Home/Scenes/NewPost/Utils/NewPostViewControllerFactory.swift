import Foundation

enum NewPostViewControllerFactory {
    static func make() -> NewPostViewController {
        let presenter = NewPostPresenter()
        let interactor = NewPostInteractor(presenter: presenter, user: .default)
        let router = NewPostRouter(dataStore: interactor)
        let viewController = NewPostViewController(interactor: interactor, router: router)
        presenter.displayLogicDelegate = viewController
        router.viewController = viewController

        return viewController
    }
}
