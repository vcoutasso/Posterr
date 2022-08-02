import Foundation

protocol NewPostPresentationLogic: AnyObject {
    var displayLogicDelegate: NewPostDisplayLogic? { get set }

    func presentUpdatedInterface(response: NewPost.ContentChange.Response)
    func presentCompletedPost(response: NewPost.Post.Response)
    func presentCancelledPost(response: NewPost.Cancel.Response)
}

