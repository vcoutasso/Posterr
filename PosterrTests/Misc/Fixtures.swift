import Foundation
@testable import Posterr

enum Fixtures {
    enum Posts {
        static let new: Post = .new(content: "", author: FakeUserManager.user1)
        static let repost: Post = .repost(post: new, reposter: FakeUserManager.user2)
        static let quote: Post = .quote(post: new, quote: "", reposter: FakeUserManager.user3)
    }
}

