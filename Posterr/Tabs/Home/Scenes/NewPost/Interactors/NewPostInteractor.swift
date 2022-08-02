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

    func contentChange(request: NewPost.ContentChange.Request) {
        let isValid = request.textLength > 0 && request.textLength <= maxTextLength
        let isEmpty = request.textLength == 0

        let response = NewPost.ContentChange.Response(
            isLengthValid: isValid,
            isEmpty: isEmpty,
            maxLength: maxTextLength)

        presenter.presentUpdatedInterface(response: response)
    }


    func post(request: NewPost.Post.Request) {
        post = Post(
            id: UUID(),
            authorId: user.id,
            content: request.content,
            originalPostId: nil,
            quote: nil)
    }
}