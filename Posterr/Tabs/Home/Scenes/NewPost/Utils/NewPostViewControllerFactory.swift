import Foundation

enum NewPostViewControllerFactory {
    static func make() -> NewPostViewController {
        let presenter = NewPostPresenter()
        let router = NewPostRouter()
        let interactor = NewPostInteractor(presenter: presenter)
        let viewController = NewPostViewController(interactor: interactor, router: router)
        presenter.displayLogicDelegate = viewController
        router.viewController = viewController

        return viewController
    }
}
