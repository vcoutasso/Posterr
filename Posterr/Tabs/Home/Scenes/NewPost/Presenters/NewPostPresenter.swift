import Foundation

final class NewPostPresenter: NewPostPresentationLogic {
    weak var displayLogicDelegate: NewPostDisplayLogic?

    func presentUpdatedInterface(response: NewPost.ContentChange.Response) {
        guard let displayLogicDelegate = displayLogicDelegate else { return }

        let viewModel = NewPost.ContentChange.ViewModel(
            isPlaceholderHidden: !response.isEmpty,
            isTextTooLong: !response.isLengthValid,
            isPostValid: response.isLengthValid && !response.isEmpty,
            maxLength: response.maxLength)

        displayLogicDelegate.displayUpdatedInterface(viewModel: viewModel)
    }

    func presentCompletedPost(response: NewPost.Post.Response) {
        let viewModel = NewPost.Post.ViewModel(didSucceed: response.didSucceed)
        displayLogicDelegate?.displayDidPost(viewModel: viewModel)
    }

    func presentCancelledPost(response: NewPost.Cancel.Response) {
        let viewModel = NewPost.Cancel.ViewModel()
        displayLogicDelegate?.displayDidCancel(viewModel: viewModel)
    }

}
