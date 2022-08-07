import Foundation
import UIKit

final class FakeUserManager: UserManager {
    private(set) var signedInUsers: [User]
    var currentUser: User {
        signedInUsers.first!
    }

    init?(signedInUsers: [User]) {
        guard !signedInUsers.isEmpty else { return nil }

        self.signedInUsers = signedInUsers
    }

    func selectUser(at index: Array.Index) {
        guard signedInUsers.indices.contains(index) else { return }

        signedInUsers.swapAt(signedInUsers.startIndex, index)
    }

    func addUser(_ user: User) {
        signedInUsers.append(user)
    }

#if DEBUG
    static let user1: User = .init(username: "earlyAdopter", preferredColor: .red)!
    static let user2: User = .init(username: "hardcoreposter", preferredColor: .green)!
    static let user3: User = .init(username: "DonutLover", preferredColor: .yellow)!
    static let user4: User = .init(username: "HyphenHater", preferredColor: .purple)!

    static let allUsers: [User] = [user1, user2, user3, user4]
#endif
}

