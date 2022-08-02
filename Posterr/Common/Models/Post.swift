import Foundation

struct Post: Equatable {
    let id: UUID
    let authorId: UUID
    let content: String
    let originalPostId: UUID?
    let quote: String?

    var type: PostType {
        originalPostId == nil ? .original : quote == nil ? .repost : .quote
    }

    enum PostType {
        case original
        case repost
        case quote
    }
}

// MARK: - Factories

extension Post {
    static func new(id: UUID = UUID(), authorId: UUID, content: String) -> Post {
        Post(
            id: id,
            authorId: authorId,
            content: content,
            originalPostId: nil,
            quote: nil)
    }

    static func repost(id: UUID = UUID(), authorId: UUID, original: Post) -> Post {
        Post(
            id: id,
            authorId: authorId,
            content: original.content,
            originalPostId: original.id,
            quote: nil)
    }

    static func repost(id: UUID = UUID(), authorId: UUID, original: Post, quote: String) -> Post {
        Post(
            id: id,
            authorId: authorId,
            content: original.content,
            originalPostId: original.id,
            quote: quote)
    }
}
