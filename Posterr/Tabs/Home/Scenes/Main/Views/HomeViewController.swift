import Foundation
import UIKit

final class HomeViewController: UIViewController {

    private let interactor: HomeInteractionLogic
    private let router: HomeRoutingLogic

    init(interactor: HomeInteractionLogic, router: HomeRoutingLogic) {
        self.interactor = interactor
        self.router = router

        super.init(nibName: nil, bundle: nil)

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
        view.addSubview(newPostButton)

        NSLayoutConstraint.activate([
            newPostButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            newPostButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }

    @objc
    func didTapNewPostButton() {
        router.routeToNewPost()
    }

    func configureNewPostButton() {
        // Makes the button circular because its height is constrained equal to its width
        newPostButton.layer.cornerRadius = newPostButton.bounds.size.height / 2
    }
}
