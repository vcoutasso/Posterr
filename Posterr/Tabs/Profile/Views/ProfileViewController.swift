import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    typealias Interactor = ProfileInteractionLogic & ProfileDataStore

    private let interactor: Interactor

    private var userManager: UserManager {
        (UIApplication.shared.delegate as! AppDelegate).userManager
    }

    private lazy var postList: PostListProtocol = {
        PostList(delegate: self, dataSource: self, tableView: UITableView())
    }()

    private var userPosts: [Post] {
        interactor.postDataStore.allPosts.filter { $0.author == userManager.currentUser }
    }

    init(interactor: Interactor) {
        self.interactor = interactor

        super.init(nibName: nil, bundle: nil)

        setupTabBarItem()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
}

// MARK: - Profile Display Logic

extension ProfileViewController: ProfileDisplayLogic {
    
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userPosts.count
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        PostTableViewCell.LayoutMetrics.minimumCellHeight
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PostTableViewCell.defaultReuseIdentifier,
            for: indexPath) as? PostTableViewCell
        else { return PostTableViewCell() }

        let post = userPosts[indexPath.row]
        cell.configure(with: post)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - Utils

private extension ProfileViewController {
    func setupTabBarItem() {
        tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill"))
    }

    func setupNavigationBar() {
        navigationItem.title = userManager.currentUser.username
    }
}
