import Foundation
@testable import Posterr

final class NewPostDisplayLogicSpy: NewPostDisplayLogic {
    private(set) var didCallDisplayUpdatedInterface = false
    func displayUpdatedInterface(_ viewModel: NewPost.ContentChange.ViewModel) {
        didCallDisplayUpdatedInterface = true
    }

    private(set) var didCallDisplayDidPost = false
    func displayDidPost(_ viewModel: NewPost.Post.ViewModel) {
        didCallDisplayDidPost = true
    }

    private(set) var didCallDisplayDidCancel = false
    func displayDidCancel(_ viewModel: NewPost.Cancel.ViewModel) {
        didCallDisplayDidCancel = true
    }
}
