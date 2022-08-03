import Foundation
@testable import Posterr

enum Fixtures {
    enum Posts {
        static let new = Post.new(id: UUID(), authorId: UUID(), content: "")
        static let repost = Post.repost(authorId: UUID(), original: new)
        static let quote = Post.quote(authorId: UUID(), original: new, quote: "")
    }
}

