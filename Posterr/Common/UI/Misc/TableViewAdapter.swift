import Foundation
import UIKit

protocol TableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    associatedtype DataWrapper
    associatedtype DisplayLogicWrapper: DisplayLogicDelegate

    var dataItems: [DataWrapper] { get }
    var displayLogicDelegate: DisplayLogicWrapper? { get }
}
