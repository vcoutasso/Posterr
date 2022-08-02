import Foundation

final class HomePresenter: HomePresentationLogic {
    weak var displayLogicDelegate: HomeDisplayLogic?

    func presentNewPostView(_ response: Home.NewPost.Response) {
        let viewModel = Home.NewPost.ViewModel()
        displayLogicDelegate?.displayNewPostView(viewModel)
    }
}
