import Foundation
import UIKit

final class NewPostViewController: UIViewController {
    init() {
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
        textView.delegate = self

        return textView
    }()
}

extension NewPostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        view.setNeedsLayout()
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
        navigationController?.popViewController(animated: true)
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
