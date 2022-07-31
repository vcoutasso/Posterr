import UIKit

final class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarViewControllers = [
            HomeViewController(),
            ProfileViewController(),
        ]

        setViewControllers(tabBarViewControllers, animated: true)
    }
}

