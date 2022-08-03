import Foundation
import UIKit

protocol PostListProtocol {
    var tableView: UITableView { get }

    func reloadData()
}

final class PostList: UIView, PostListProtocol {
    private(set) var tableView: UITableView

    init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, tableView: UITableView) {
        self.tableView = tableView

        super.init(frame: .zero)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self)

        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func reloadData() {
        tableView.reloadData()
    }

}

extension PostList: CodedViewLifecycle {
    func addSubviews() {
        addSubview(tableView)
    }

    func constrainSubviews() {

    }
}
