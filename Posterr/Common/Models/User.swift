import Foundation

struct User: Equatable {
    let id: UUID
    let username: String
    let userSince: Date

    static let `default`: Self = .init(id: UUID(), username: "", userSince: Date.now)
}
