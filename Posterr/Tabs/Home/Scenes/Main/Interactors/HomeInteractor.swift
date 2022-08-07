import Foundation

final class HomeInteractor: HomeInteractionLogic, HomeDataStore {
    private(set) var presenter: HomePresentationLogic
    private(set) var postDataStore: PostDataStore

    init(presenter: HomePresentationLogic, postDataStore: PostDataStore)  {
        self.presenter = presenter
        self.postDataStore = postDataStore
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

