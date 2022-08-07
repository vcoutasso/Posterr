import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let postDataStore = AppPostDataStore()
        let homeViewController = HomeViewControllerFactory.make(postDataStore: postDataStore)
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let profileViewController = ProfileViewControllerFactory.make(postDataStore: postDataStore)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)

        let tabBarViewControllers = [
            homeNavigationController,
            profileNavigationController,
        ]

        tabBar.backgroundColor = .systemBackground
        setViewControllers(tabBarViewControllers, animated: true)
    }
}

