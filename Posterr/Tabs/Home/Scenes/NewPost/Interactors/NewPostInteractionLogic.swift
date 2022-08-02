import Foundation

protocol NewPostInteractionLogic: AnyObject {
    var presenter: NewPostPresentationLogic { get }

    func contentChange(request: NewPost.ContentChange.Request)
    func makePost(request: NewPost.Post.Request)
    func cancelPost(request: NewPost.Cancel.Request)
}
