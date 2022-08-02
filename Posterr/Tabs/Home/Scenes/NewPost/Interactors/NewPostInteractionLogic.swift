import Foundation

protocol NewPostInteractionLogic: AnyObject {
    var presenter: NewPostPresentationLogic { get }

    func contentChange(request: NewPost.ContentChange.Request)
    func post(request: NewPost.Post.Request)
}
