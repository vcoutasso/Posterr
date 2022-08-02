import Foundation

final class NewPostPresenter: NewPostPresentationLogic {
    weak var displayLogicDelegate: NewPostDisplayLogic?

    func presentUpdatedInterface(_ response: NewPost.ContentChange.Response) {
        guard let displayLogicDelegate = displayLogicDelegate else { return }

        let viewModel = NewPost.ContentChange.ViewModel(
            isPlaceholderHidden: !response.isEmpty,
            isTextTooLong: !response.isLengthValid,
            isPostValid: response.isLengthValid && !response.isEmpty,
            maxLength: response.maxLength)

        displayLogicDelegate.displayUpdatedInterface(viewModel)
    }

    func presentCompletedPost(_ response: NewPost.Post.Response) {
        let viewModel = NewPost.Post.ViewModel(didSucceed: response.didSucceed)
        displayLogicDelegate?.displayDidPost(viewModel)
    }

    func presentCancelledPost(_ response: NewPost.Cancel.Response) {
        let viewModel = NewPost.Cancel.ViewModel()
        displayLogicDelegate?.displayDidCancel(viewModel)
    }

}
