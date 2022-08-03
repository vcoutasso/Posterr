import Foundation

protocol NewPostDisplayLogic: DisplayLogicDelegate {
    func displayUpdatedInterface(_ viewModel: NewPost.ContentChange.ViewModel)
    func displayDidPost(_ viewModel: NewPost.Post.ViewModel)
    func displayDidCancel(_ viewModel: NewPost.Cancel.ViewModel)
}
