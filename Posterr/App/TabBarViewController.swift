import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewControllerFactory.make()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let profileViewController = ProfileViewControllerFactory.make()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)

        let tabBarViewControllers = [
            homeNavigationController,
            profileNavigationController,
        ]

        setViewControllers(tabBarViewControllers, animated: true)
    }
}

