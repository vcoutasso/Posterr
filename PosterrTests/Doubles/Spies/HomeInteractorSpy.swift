import Foundation
@testable import Posterr

final class HomeInteractorSpy: HomeInteractionLogic & HomeDataStore {
    private(set) var presenter: HomePresentationLogic
    private(set) var allPosts: [Post]

    init(presenter: HomePresentationLogic, allPosts: [Post] = []) {
        self.presenter = presenter
        self.allPosts = allPosts
    }

    private(set) var didCallNewPost = false
    func newPost(_ request: Home.NewPost.Request) {
        didCallNewPost = true
    }

    private(set) var didCallAddPost = false
    func addPost(_ post: Post) {
        didCallAddPost = true
    }

    private(set) var didFetchPosts = false
    func fetchPosts(_ request: Home.Posts.Request) {
        didFetchPosts = true
    }
}
