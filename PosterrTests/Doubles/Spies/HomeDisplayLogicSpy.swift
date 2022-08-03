@testable import Posterr

final class HomeDisplayLogicSpy: HomeDisplayLogic {
    private(set) var didDisplayNewPostView = false
    func displayNewPostView(_ viewModel: Home.NewPost.ViewModel) {
        didDisplayNewPostView = true
    }
}
