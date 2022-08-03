import Foundation

final class NewPostInteractor: NewPostInteractionLogic, NewPostDataStore {
    private(set) var presenter: NewPostPresentationLogic

    private(set) var user: User
    private(set) var post: Post?

    private let maxTextLength: Int = 777

    init(presenter: NewPostPresentationLogic, user: User) {
        self.presenter = presenter
        self.user = user
    }

    func handleContentChange(_ request: NewPost.ContentChange.Request) {
        let isValid = request.textLength > 0 && request.textLength <= maxTextLength
        let isEmpty = request.textLength == 0

        let response = NewPost.ContentChange.Response(
            isLengthValid: isValid,
            isEmpty: isEmpty,
            maxLength: maxTextLength)

        presenter.presentUpdatedInterface(response)
    }

    func makePost(_ request: NewPost.Post.Request) {
        let newPost = Post.new(
            authorId: user.id,
            content: request.content)
        post = newPost

        let response = NewPost.Post.Response(didSucceed: true)
        presenter.presentCompletedPost(response)
    }

    func cancelPost(_ request: NewPost.Cancel.Request) {
        let response = NewPost.Cancel.Response()
        presenter.presentCancelledPost(response)
    }
}
