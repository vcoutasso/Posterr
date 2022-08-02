import Foundation

final class HomeInteractor: HomeInteractionLogic, HomeDataStore {
    private(set) var presenter: HomePresentationLogic
    private(set) var allPosts: [Post]

    init(presenter: HomePresentationLogic, posts: [Post] = []) {
        self.presenter = presenter
        self.allPosts = posts
    }

    func addPost(_ post: Post) {
        allPosts.append(post)
    }
}
