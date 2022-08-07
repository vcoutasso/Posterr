import Foundation

protocol PostDataStore: AnyObject {
    var allPosts: [Post] { get }

    func addNewPost(_ post: Post)
}
