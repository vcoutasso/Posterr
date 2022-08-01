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
