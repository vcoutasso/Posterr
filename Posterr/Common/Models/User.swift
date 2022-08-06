import Foundation
import UIKit

struct User: Equatable {
    let id: UUID
    let username: String
    let userSince: Date
    let preferredColor: UIColor

    init?(username: String, preferredColor: UIColor) {
        guard !username.isEmpty,
              username.count <= 14,
              username.allSatisfy({ $0.isASCII && ($0.isLetter || $0.isNumber) })
        else { return nil }

        self.id = UUID()
        self.username = username
        self.userSince = .now
        self.preferredColor = preferredColor
    }

#if DEBUG
    static let debugUser1: Self = .init(username: "earlyAdopter", preferredColor: .red)!
    static let debugUser2: Self = .init(username: "hardcoreposter", preferredColor: .green)!
    static let debugUser3: Self = .init(username: "DonutLover", preferredColor: .yellow)!
    static let debugUser4: Self = .init(username: "HyphenHater", preferredColor: .purple)!

    static let debugUsers: [Self] = [debugUser1, debugUser2, debugUser3, debugUser4]
#endif
}
