import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarViewControllers = [
            HomeViewController(),
            ProfileViewController(),
        ]

        setViewControllers(tabBarViewControllers, animated: true)
    }
}

