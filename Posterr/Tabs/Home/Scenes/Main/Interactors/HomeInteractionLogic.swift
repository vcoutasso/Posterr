import Foundation

protocol HomeInteractionLogic: AnyObject {
    var presenter: HomePresentationLogic { get }

    func newPost(_ request: Home.NewPost.Request)
}
