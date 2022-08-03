import Foundation

protocol ReusableView {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView {
    static var defaultReuseIdentifier: String {
        String(describing: self)
    }
}
