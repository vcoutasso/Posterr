import Foundation
@testable import Posterr

final class HomeRouterSpy: HomeRoutingLogic, HomeDataPassing {
    private(set) var dataStore: HomeDataStore

    init(dataStore: HomeDataStore) {
        self.dataStore = dataStore
    }

    private(set) var didCallRouteToNewPost = false
    func routeToNewPost() {
        didCallRouteToNewPost = true
    }
}
