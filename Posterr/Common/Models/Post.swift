import Foundation

struct Post: Equatable {
    let id: UUID
    let authorId: UUID
    let content: String
    let originalPostId: UUID?
    let quote: String?
    let type: PostType

    private init(id: UUID, authorId: UUID, content: String, originalPostId: UUID? = nil, quote: String? = nil, type: PostType) {
        self.id = id
        self.authorId = authorId
        self.content = content
        self.originalPostId = originalPostId
        self.quote = quote
        self.type = type
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
            type: .original)
    }

    static func repost(id: UUID = UUID(), authorId: UUID, original: Post) -> Post {
        Post(
            id: id,
            authorId: authorId,
            content: original.content,
            originalPostId: original.id,
            type: .repost)
    }

    static func quote(id: UUID = UUID(), authorId: UUID, original: Post, quote: String) -> Post {
        Post(
            id: id,
            authorId: authorId,
            content: original.content,
            originalPostId: original.id,
            quote: quote,
            type: .quote)
    }
}
