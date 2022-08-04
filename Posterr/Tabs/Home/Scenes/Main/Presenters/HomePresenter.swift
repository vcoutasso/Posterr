import Foundation

final class HomePresenter: HomePresentationLogic {
    weak var displayLogicDelegate: HomeDisplayLogic?

    func presentNewPostView(_ response: Home.NewPost.Response) {
        let viewModel = Home.NewPost.ViewModel()
        displayLogicDelegate?.displayNewPostView(viewModel)
    }

    func presentPosts(_ response: Home.Posts.Response) {
        let viewModel = Home.Posts.ViewModel()
        displayLogicDelegate?.displayPosts(viewModel)
    }
}
