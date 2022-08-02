import Foundation

protocol NewPostInteractionLogic: AnyObject {
    var presenter: NewPostPresentationLogic { get }

    func contentChange(_ request: NewPost.ContentChange.Request)
    func makePost(_ request: NewPost.Post.Request)
    func cancelPost(_ request: NewPost.Cancel.Request)
}
