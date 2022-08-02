import Foundation
import UIKit

final class HomeRouter: HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    private(set) var dataStore: HomeDataStore

    init(dataStore: HomeDataStore) {
        self.dataStore = dataStore
    }

    func routeToNewPost() {
        guard let viewController = viewController else { return }

        let destinationVC = NewPostViewControllerFactory.make()
        let sourceDS = viewController.interactor
        let destinationDS = destinationVC.interactor

        passDataToNewPost(source: sourceDS, destination: destinationDS)
        navigateToNewPost(source: viewController, destination: destinationVC)
    }

    private func passDataToNewPost(source: HomeDataStore, destination: NewPostDataStore) {
    }

    private func navigateToNewPost(source: HomeViewController, destination: NewPostViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
