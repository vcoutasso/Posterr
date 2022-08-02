import Foundation

protocol NewPostDisplayLogic: AnyObject {
    func displayUpdatedInterface(viewModel: NewPost.ContentChange.ViewModel)
    func displayDidPost(viewModel: NewPost.Post.ViewModel)
    func displayDidCancel(viewModel: NewPost.Cancel.ViewModel)
}
