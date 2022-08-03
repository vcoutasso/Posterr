import Foundation
import UIKit

final class PostTableViewCell: UITableViewCell, ReusableView {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(with post: Post) {
        var content = defaultContentConfiguration()

        content.text = post.content

        contentConfiguration = content
    }
}

// MARK: - PostTableViewCell + CodedViewLifecycle

extension PostTableViewCell: CodedViewLifecycle {
    func addSubviews() {
    }

    func constrainSubviews() {

    }
}
