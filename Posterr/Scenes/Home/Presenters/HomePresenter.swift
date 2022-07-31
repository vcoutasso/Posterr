import Foundation

final class HomePresenter: HomePresentationLogic {
    private(set) weak var displayLogic: HomeDisplayLogic?

    func setDisplayLogicDelegate(_ delegate: HomeDisplayLogic) {
        displayLogic = delegate
    }
}
