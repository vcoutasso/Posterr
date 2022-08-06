import Foundation
@testable import Posterr

enum Fixtures {
    enum Posts {
        static let new: Post = .new(content: "", author: .debugUser1)
        static let repost: Post = .repost(post: new, reposter: .debugUser2)
        static let quote: Post = .quote(post: new, quote: "", reposter: .debugUser3)
    }
}

