import Foundation

protocol UserManagerProtocol {
    var currentUser: User { get }
    var signedInUsers: [User] { get }

    func selectUser(at index: Int)
    func addUser(_ user: User)
}

final class UserManager: UserManagerProtocol {
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
}

