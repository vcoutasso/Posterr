import Foundation

final class HomeInteractor: HomeInteractionLogic, HomeDataStore {
    private(set) var presenter: HomePresentationLogic
    private(set) var allPosts: [Post]

    init(presenter: HomePresentationLogic, posts: [Post] = []) {
        self.presenter = presenter
        self.allPosts = posts
    }

    func newPost(_ request: Home.NewPost.Request) {
        let response = Home.NewPost.Response()
        presenter.presentNewPostView(response)
    }

    func fetchPosts(_ request: Home.Posts.Request) {
        let response = Home.Posts.Response()
        presenter.presentPosts(response)
    }
}

extension HomeInteractor {
    func addNewPost(_ post: Post) {
        allPosts.insert(post, at: allPosts.startIndex)
    }
}
