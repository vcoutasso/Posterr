import Foundation
import UIKit

final class HomeViewController: UIViewController {
    typealias Interactor = HomeInteractionLogic & HomeDataStore
    typealias Router = HomeRoutingLogic & HomeDataPassing
    typealias Adapter = PostTableViewAdapter<HomeViewController>

    private(set) var interactor: Interactor
    private let router: Router
    private let tableAdapter: Adapter
    private lazy var postList: PostListProtocol = {
        PostList(delegate: tableAdapter, dataSource: tableAdapter, tableView: UITableView())
    }()

    init(interactor: Interactor, router: Router, tableAdapter: Adapter, postList: PostListProtocol? = nil) {
        self.interactor = interactor
        self.router = router
        self.tableAdapter = tableAdapter

        super.init(nibName: nil, bundle: nil)

        if let postList = postList {
            self.postList = postList
        }

        setupTabBarItem()
        setupNavigationBar()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupSubviews()

        requestPosts()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureNewPostButton()
    }

    private lazy var newPostButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "square.and.pencil")
        configuration.buttonSize = .medium

        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapNewPostButton), for: .touchUpInside)
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true

        return button
    }()
}

// MARK: - Home Display Logic

extension HomeViewController: HomeDisplayLogic {
    func displayPosts(_ viewModel: Home.Posts.ViewModel) {
        postList.reloadData()
    }

    func displayNewPostView(_ viewModel: Home.NewPost.ViewModel) {
        router.routeToNewPost()
    }
}

// MARK: - Utils

private extension HomeViewController {
    func setupTabBarItem() {
        tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
    }

    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle"),
            style: .plain,
            target: nil,
            action: nil)

        navigationItem.title = "Posterr"
    }

    func setupSubviews() {
        view.addSubview(postList.tableView)
        view.addSubview(newPostButton)

        NSLayoutConstraint.activate([
            postList.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postList.tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            postList.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postList.tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            newPostButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            newPostButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }

    func requestPosts() {
        let request = Home.Posts.Request()
        interactor.fetchPosts(request)
    }

    @objc
    private func didTapNewPostButton() {
        let request = Home.NewPost.Request()
        interactor.newPost(request)
    }

    func configureNewPostButton() {
        // Makes the button circular because its height is constrained equal to its width
        newPostButton.layer.cornerRadius = newPostButton.bounds.size.height / 2
    }
}
