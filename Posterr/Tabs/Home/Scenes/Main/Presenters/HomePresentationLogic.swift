import Foundation

protocol HomePresentationLogic: AnyObject {
    var displayLogicDelegate: HomeDisplayLogic? { get set }

    func presentNewPostView(_ response: Home.NewPost.Response)
}
