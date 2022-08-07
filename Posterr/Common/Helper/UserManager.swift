import Foundation

protocol UserManager {
    var currentUser: User { get }
    var signedInUsers: [User] { get }

    func selectUser(at index: Int)
    func addUser(_ user: User)
}
