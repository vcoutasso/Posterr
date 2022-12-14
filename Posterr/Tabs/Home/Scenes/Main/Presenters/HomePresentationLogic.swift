import Foundation

protocol HomePresentationLogic: AnyObject {
    var displayLogicDelegate: HomeDisplayLogic? { get set }

    func presentPosts(_ response: Home.Posts.Response)
    func presentNewPostView(_ response: Home.NewPost.Response)
}
