import Foundation
import UIKit

final class ProfileViewController: UIViewController {

    private let interactor: ProfileInteractionLogic

    private var userManager: UserManager {
        (UIApplication.shared.delegate as! AppDelegate).userManager
    }

    init(interactor: ProfileInteractionLogic) {
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
