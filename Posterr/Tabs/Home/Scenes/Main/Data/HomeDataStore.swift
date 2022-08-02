import Foundation

protocol HomeDataStore: AnyObject {
    var allPosts: [Post] { get }

    func addPost(_ post: Post)
}
