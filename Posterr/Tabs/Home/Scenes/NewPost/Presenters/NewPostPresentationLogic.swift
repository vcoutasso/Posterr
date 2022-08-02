import Foundation

protocol NewPostPresentationLogic: AnyObject {
    var displayLogicDelegate: NewPostDisplayLogic? { get set }

    func presentUpdatedInterface(_ response: NewPost.ContentChange.Response)
    func presentCompletedPost(_ response: NewPost.Post.Response)
    func presentCancelledPost(_ response: NewPost.Cancel.Response)
}

