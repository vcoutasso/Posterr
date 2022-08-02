import Foundation

final class NewPostPresenter: NewPostPresentationLogic {
    weak var displayLogicDelegate: NewPostDisplayLogic?

    func presentUpdatedInterface(response: NewPost.ContentDidChange.Response) {
        guard let displayLogicDelegate = displayLogicDelegate else { return }

        let viewModel = NewPost.ContentDidChange.ViewModel(
            isPlaceholderHidden: !response.isEmpty,
            isTextTooLong: !response.isLengthValid,
            isPostValid: response.isLengthValid && !response.isEmpty,
            maxLength: response.maxLength)

        displayLogicDelegate.displayUpdatedInterface(viewModel: viewModel)
    }
}
