import UIKit

final class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home",
                                                     image: UIImage(systemName: "house"),
                                                     selectedImage: UIImage(systemName: "house.fill"))
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile",
                                                        image: UIImage(systemName: "person"),
                                                        selectedImage: UIImage(systemName: "person.fill"))

        setViewControllers([homeViewController, profileViewController], animated: true)
    }
}

