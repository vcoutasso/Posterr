import Foundation

protocol HomeInteractionLogic: AnyObject {
    var presenter: HomePresentationLogic { get }

    func fetchPosts(_ request: Home.Posts.Request)
    func newPost(_ request: Home.NewPost.Request)
}
