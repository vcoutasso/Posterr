import Foundation

final class ProfileInteractor: ProfileInteractionLogic {
    private(set) var presenter: ProfilePresentationLogic

    init(presenter: ProfilePresentationLogic) {
        self.presenter = presenter
    }
}
