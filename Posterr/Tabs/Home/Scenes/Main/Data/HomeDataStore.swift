import Foundation

protocol HomeDataStore: AnyObject {
    var allPosts: [Post] { get }

    func addNewPost(_ post: Post)
}
