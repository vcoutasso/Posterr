import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarViewControllers = [
            HomeViewControllerFactory.make(),
            ProfileViewController(),
        ]

        setViewControllers(tabBarViewControllers, animated: true)
    }
}

