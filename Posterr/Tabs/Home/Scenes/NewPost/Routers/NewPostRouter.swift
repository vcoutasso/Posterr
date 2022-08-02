import Foundation
import UIKit

final class NewPostRouter: NewPostRoutingLogic, NewPostDataPassing {
    weak var viewController: NewPostViewController?
    private(set) var dataStore: NewPostDataStore

    init(dataStore: NewPostDataStore) {
        self.dataStore = dataStore
    }

    func routeToParent() {
        guard let destinationVC = viewController?.navigationController?.previousViewController as? HomeViewController,
              let viewController = viewController else { return }

        let sourceDS = viewController.interactor
        let destinationDS = destinationVC.interactor

        passDataToParent(source: sourceDS, destination: destinationDS)
        navigateToParent(source: viewController, destination: destinationVC)
    }

    private func passDataToParent(source: NewPostDataStore, destination: HomeDataStore) {
        guard let post = source.post else { return }

        destination.addPost(post)
    }

    private func navigateToParent(source: NewPostViewController, destination: HomeViewController) {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
