import Foundation
@testable import Posterr

final class NewPostInteractorSpy: NewPostInteractionLogic & NewPostDataStore {
    private(set) var presenter: NewPostPresentationLogic

    private(set) var user: User
    private(set) var post: Post?

    init(presenter: NewPostPresentationLogic, user: User, post: Post? = nil) {
        self.presenter = presenter
        self.user = user
        self.post = post
    }

    private(set) var didCallContentChange = false
    func handleContentChange(_ request: NewPost.ContentChange.Request) {
        didCallContentChange = true
    }

    private(set) var didCallMakePost = false
    func makePost(_ request: NewPost.Post.Request) {
        didCallMakePost = true
    }

    private(set) var didCallCancelPost = false
    func cancelPost(_ request: NewPost.Cancel.Request) {
        didCallCancelPost = true
    }
}
