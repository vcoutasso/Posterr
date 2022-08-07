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
}
