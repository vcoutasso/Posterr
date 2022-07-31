import Foundation
import UIKit

final class ProfileViewController: UIViewController {

    private let interactor: ProfileInteractionLogic

    init(interactor: ProfileInteractionLogic) {
        self.interactor = interactor

        super.init(nibName: nil, bundle: nil)

        tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill"))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

// MARK: - Profile Display Logic

extension ProfileViewController: ProfileDisplayLogic {
    
}
