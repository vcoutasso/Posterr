import Foundation
@testable import Posterr

final class HomePresenterSpy: HomePresentationLogic {
    var displayLogicDelegate: HomeDisplayLogic?

    private(set) var didCallPresentNewPostView = false
    func presentNewPostView(_ response: Home.NewPost.Response) {
        didCallPresentNewPostView = true
    }
}
