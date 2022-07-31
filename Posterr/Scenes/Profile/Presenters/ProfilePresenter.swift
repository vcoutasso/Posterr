import Foundation

final class ProfilePresenter: ProfilePresentationLogic {
    private(set) weak var displayLogic: ProfileDisplayLogic?

    func setDisplayLogicDelegate(_ delegate: ProfileDisplayLogic) {
        displayLogic = delegate
    }
}
