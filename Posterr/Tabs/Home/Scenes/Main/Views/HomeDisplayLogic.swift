import Foundation

protocol HomeDisplayLogic: DisplayLogicDelegate {
    func displayPosts(_ viewModel: Home.Posts.ViewModel)
    func displayNewPostView(_ viewModel: Home.NewPost.ViewModel)
}
