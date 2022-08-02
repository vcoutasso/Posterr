import Foundation

final class NewPostInteractor: NewPostInteractionLogic {
    private(set) var presenter: NewPostPresentationLogic

    private let maxTextLength: Int = 777

    init(presenter: NewPostPresentationLogic) {
        self.presenter = presenter
    }

    func contentDidChange(request: NewPost.ContentDidChange.Request) {
        let isValid = request.textLength <= maxTextLength
        let isEmpty = request.textLength == 0

        let response = NewPost.ContentDidChange.Response(
            isLengthValid: isValid,
            isEmpty: isEmpty,
            maxLength: maxTextLength)

        presenter.presentUpdatedInterface(response: response)
    }
}
