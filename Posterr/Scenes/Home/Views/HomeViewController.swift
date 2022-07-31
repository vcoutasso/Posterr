import Foundation
import UIKit

final class HomeViewController: UIViewController {

    private let interactor: HomeInteractionLogic

    init(interactor: HomeInteractionLogic) {
        self.interactor = interactor

        super.init(nibName: nil, bundle: nil)

        tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

extension HomeViewController: HomeDisplayLogic {
    
}
