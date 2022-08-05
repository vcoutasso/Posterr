import Foundation
@testable import Posterr

enum Fixtures {
    enum Posts {
        static let new: Post = .new(content: "", author: .default)
        static let repost: Post = .repost(post: new, reposter: .default)
        static let quote: Post = .quote(post: new, quote: "", reposter: .default)
    }
}

