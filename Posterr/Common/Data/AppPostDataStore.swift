import Foundation

final class AppPostDataStore: PostDataStore {
    private(set) var allPosts: [Post]

    init(allPosts: [Post] = []) {
        self.allPosts = allPosts
    }

    func addNewPost(_ post: Post) {
        allPosts.insert(post, at: allPosts.startIndex)
    }
}
