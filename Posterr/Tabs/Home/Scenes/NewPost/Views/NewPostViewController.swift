import Foundation
import UIKit

final class NewPostViewController: UIViewController {
    private let interactor: NewPostInteractionLogic
    private let router: NewPostRoutingLogic

    init(interactor: NewPostInteractionLogic, router: NewPostRoutingLogic) {
        self.interactor = interactor
        self.router = router
        
        super.init(nibName: nil, bundle: nil)

        setupNavigationBar()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupSubviews()
    }

    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .preferredFont(forTextStyle: .body)
        textView.textAlignment = .left
        textView.addSubview(placeholderLabel)
        textView.delegate = self

        return textView
    }()

    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "What's up?"
        label.font = .preferredFont(forTextStyle: .body)
        // Align with `textView` cursor
        label.frame.origin = CGPoint(x: 5,
                                     y: UIFont.preferredFont(forTextStyle: .body).pointSize / 2)
        label.textColor = .tertiaryLabel
        label.textAlignment = .left
        label.sizeToFit()

        return label
    }()
}

// MARK: - Display Logic

extension NewPostViewController: NewPostDisplayLogic {

}

// MARK: - UITextViewDelegate

extension NewPostViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}

// MARK: - Utils

private extension NewPostViewController {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(didTapCancelButton))

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDoneButton))
    }

    @objc
    func didTapCancelButton() {
        router.routeToPrevious()
    }

    @objc
    func didTapDoneButton() {

    }

    func setupSubviews() {
        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
}

