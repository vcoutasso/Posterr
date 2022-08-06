import Foundation

struct Post: Equatable {
    let id: UUID
    let author: User
    let content: String
    let date: Date
    let originalPostId: UUID?
    let quote: String?
    let type: PostType

    private init(author: User, content: String, originalPostId: UUID? = nil, quote: String? = nil, type: PostType) {
        self.id = UUID()
        self.date = .now
        self.author = author
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
    static func new(content: String, author: User) -> Post {
        Post(
            author: author,
            content: content,
            type: .original)
    }

    static func repost(post: Post, reposter: User) -> Post {
        Post(
            author: reposter,
            content: post.content,
            originalPostId: post.id,
            type: .repost)
    }

    static func quote(post: Post, quote: String, reposter: User) -> Post {
        Post(
            author: reposter,
            content: post.content,
            originalPostId: post.id,
            quote: quote,
            type: .quote)
    }
}
