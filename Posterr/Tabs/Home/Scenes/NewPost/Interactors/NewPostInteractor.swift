import Foundation

final class NewPostInteractor: NewPostInteractionLogic {
    private(set) var presenter: NewPostPresentationLogic

    init(presenter: NewPostPresentationLogic) {
        self.presenter = presenter
    }
}
