import Foundation
@testable import Posterr

final class HomeInteractorSpy: HomeInteractionLogic & HomeDataStore {
    private(set) var presenter: HomePresentationLogic
    private(set) var postDataStore: PostDataStore

    init(presenter: HomePresentationLogic, postDataStore: PostDataStore) {
        self.presenter = presenter
        self.postDataStore = postDataStore
    }

    private(set) var didCallNewPost = false
    func newPost(_ request: Home.NewPost.Request) {
        didCallNewPost = true
    }

    private(set) var didCallAddPost = false
    func addNewPost(_ post: Post) {
        didCallAddPost = true
    }

    private(set) var didFetchPosts = false
    func fetchPosts(_ request: Home.Posts.Request) {
        didFetchPosts = true
    }
}
