import Foundation
import UIKit

final class ProfileViewController: UIViewController {

    private let interactor: ProfileInteractionLogic

    init(interactor: ProfileInteractionLogic) {
        self.interactor = interactor

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

        view.backgroundColor = .systemBackground
    }
}

// MARK: - Profile Display Logic

extension ProfileViewController: ProfileDisplayLogic {
    
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
}
