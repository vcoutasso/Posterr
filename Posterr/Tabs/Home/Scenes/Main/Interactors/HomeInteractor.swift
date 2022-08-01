import Foundation

final class HomeInteractor: HomeInteractionLogic {
    private(set) var presenter: HomePresentationLogic

    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
    }
}
