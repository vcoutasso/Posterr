import Foundation

protocol HomeDataStore: AnyObject {
    var postDataStore: PostDataStore { get }
}
