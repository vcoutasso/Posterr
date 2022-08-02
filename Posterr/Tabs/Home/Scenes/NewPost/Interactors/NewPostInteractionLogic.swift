import Foundation

protocol NewPostInteractionLogic: AnyObject {
    var presenter: NewPostPresentationLogic { get }

    func contentDidChange(request: NewPost.ContentDidChange.Request)
}
