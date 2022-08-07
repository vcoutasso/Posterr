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
        
        updateView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupNavigationBar()
        setupSubviews()
    }

    // MARK: Subviews

    private lazy var profileImage: UIImage? = {
        let image = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal)

        return image
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .clear
        label.textColor = .label
        label.textAlignment = .center
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .subheadline).withSymbolicTraits(.traitBold)!
        label.font = UIFont(descriptor: descriptor, size: .zero)

        return label
    }()

    private lazy var userSinceLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .clear
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private lazy var postCountLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .clear
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private lazy var infoStackView: UIStackView = {
        let separator = UIView()
        separator.tintColor = .separator
        separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        let stack = UIStackView(arrangedSubviews: [userSinceLabel, separator, postCountLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing

        return stack
    }()

    private lazy var headerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileImageView, usernameLabel, infoStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.contentMode = .scaleAspectFill

        return stack
    }()

    // MARK: Layout Metrics

    private enum LayoutMetrics {
        static let headerViewWidthMultiplier: CGFloat = 0.6
        static let headerViewHeightMultiplier: CGFloat = 0.15
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
        navigationItem.title = "Profile"
    }

    func setupSubviews() {
        view.addSubview(headerStackView)
        view.addSubview(postList.tableView)

        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: LayoutMetrics.headerViewWidthMultiplier),
            headerStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: LayoutMetrics.headerViewHeightMultiplier),
            postList.tableView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            postList.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postList.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postList.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func updateView() {
        let currentUser = userManager.currentUser
        profileImageView.image = profileImage?.withTintColor(currentUser.preferredColor)
        usernameLabel.text = currentUser.username
        userSinceLabel.text = "Joined: \(currentUser.userSince.formatted(date: .abbreviated, time: .omitted))"
        postCountLabel.text = "Posts: \(userPosts.count)"
        postList.reloadData()
    }
}
