import Foundation
import UIKit

final class PostTableViewAdapter<T: DisplayLogicDelegate>: NSObject, TableViewAdapter {
    typealias DataWrapper = Post
    typealias DisplayLogicWrapper = T

    private(set) var dataItems: [DataWrapper]
    private(set) weak var displayLogicDelegate: DisplayLogicWrapper?

    init(posts: [DataWrapper] = [Post.new(authorId: UUID(), content: "aaaaaaaaaa")], displayLogicDelegate: DisplayLogicWrapper? = nil) {
        self.dataItems = posts
        self.displayLogicDelegate = displayLogicDelegate
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataItems.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PostTableViewCell.defaultReuseIdentifier,
            for: indexPath) as? PostTableViewCell
        else { return PostTableViewCell() }

        let post = dataItems[indexPath.row]
        cell.setupCell(with: post)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
