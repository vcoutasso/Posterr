import Foundation
@testable import Posterr

final class HomePresenterSpy: HomePresentationLogic {
    var displayLogicDelegate: HomeDisplayLogic?

    private(set) var didPresentNewPostView = false
    func presentNewPostView(_ response: Home.NewPost.Response) {
        didPresentNewPostView = true
    }

    private(set) var didPresentPosts = false
    func presentPosts(_ response: Home.Posts.Response) {
        didPresentPosts = true
    }
}
