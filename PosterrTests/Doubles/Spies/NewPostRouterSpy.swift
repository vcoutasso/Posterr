import Foundation
@testable import Posterr

final class NewPostRouterSpy: NewPostRoutingLogic & NewPostDataPassing {
    var dataStore: NewPostDataStore

    init(dataStore: NewPostDataStore) {
        self.dataStore = dataStore
    }

    private(set) var didRouteToParent = false
    func routeToParent() {
        didRouteToParent = true
    }
}
