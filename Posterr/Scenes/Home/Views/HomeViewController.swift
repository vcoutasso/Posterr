import Foundation
import UIKit

final class HomeViewController: UIViewController {

    private let interactor: HomeInteractionLogic

    private lazy var newPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New Post", for: .normal)
        button.addTarget(self, action: #selector(didTapNewPostButton), for: .touchUpInside)

        return button
    }()

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

        view.addSubview(newPostButton)

        NSLayoutConstraint.activate([
            newPostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newPostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc
    private func didTapNewPostButton() {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
}

extension HomeViewController: HomeDisplayLogic {
    
}
