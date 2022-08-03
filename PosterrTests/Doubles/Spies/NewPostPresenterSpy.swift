import Foundation
@testable import Posterr

final class NewPostPresenterSpy: NewPostPresentationLogic {
    var displayLogicDelegate: NewPostDisplayLogic?

    private(set) var didPresentUpdatedInterface = false
    func presentUpdatedInterface(_ response: NewPost.ContentChange.Response) {
        didPresentUpdatedInterface = true
    }

    private(set) var didPresentCompletedPost = false
    func presentCompletedPost(_ response: NewPost.Post.Response) {
        didPresentCompletedPost = true
    }

    private(set) var didPresentCancelledPost = false
    func presentCancelledPost(_ response: NewPost.Cancel.Response) {
        didPresentCancelledPost = true
    }
}
