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
    static func new(content: String, poster: User) -> Post {
        Post(
            id: UUID(),
            authorId: poster.id,
            content: content,
            type: .original)
    }

    static func repost(post: Post, reposter: User) -> Post {
        Post(
            id: UUID(),
            authorId: reposter.id,
            content: post.content,
            originalPostId: post.id,
            type: .repost)
    }

    static func quote(post: Post, quote: String, reposter: User) -> Post {
        Post(
            id: UUID(),
            authorId: reposter.id,
            content: post.content,
            originalPostId: post.id,
            quote: quote,
            type: .quote)
    }
}
