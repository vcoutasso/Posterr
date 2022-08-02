import Foundation

protocol NewPostDataStore: AnyObject {
    var user: User { get }
    var post: Post? { get }
}
