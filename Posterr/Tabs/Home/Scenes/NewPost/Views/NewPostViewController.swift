import Foundation
import UIKit

final class NewPostViewController: UIViewController {
    typealias Interactor = NewPostInteractionLogic & NewPostDataStore
    typealias Router = NewPostRoutingLogic & NewPostDataPassing

    private(set) var interactor: Interactor
    private let router: Router

    init(interactor: Interactor, router: Router) {
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

        setupSubviews()

        view.backgroundColor = .systemBackground
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

    private lazy var contentLengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()
}

// MARK: - Display Logic

extension NewPostViewController: NewPostDisplayLogic {
    func displayUpdatedInterface(_ viewModel: NewPost.ContentChange.ViewModel) {
        placeholderLabel.isHidden = viewModel.isPlaceholderHidden

        contentLengthLabel.text = "\(textView.text.count)/\(viewModel.maxLength)"
        contentLengthLabel.textColor = viewModel.isTextTooLong ? .systemRed : .secondaryLabel

        navigationItem.rightBarButtonItem?.isEnabled = viewModel.isPostValid
    }

    func displayDidPost(_ viewModel: NewPost.Post.ViewModel) {
        if viewModel.didSucceed {
            router.routeToParent()
        }
    }

    func displayDidCancel(_ viewModel: NewPost.Cancel.ViewModel) {
        router.routeToParent()
    }
}

// MARK: - UITextViewDelegate

extension NewPostViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let request = NewPost.ContentChange.Request(textLength: textView.text.count)
        interactor.handleContentChange(request)
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

        navigationItem.rightBarButtonItem?.isEnabled = false
    }

    @objc
    func didTapCancelButton() {
        let request = NewPost.Cancel.Request()
        interactor.cancelPost(request)
    }

    @objc
    func didTapDoneButton() {
        let request = NewPost.Post.Request(content: textView.text)
        interactor.makePost(request)
    }

    func setupSubviews() {
        view.addSubview(textView)
        view.addSubview(contentLengthLabel)

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            contentLengthLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            contentLengthLabel.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -5),
        ])
    }

    func updatePlaceholderVisibility() {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }

    func updateContentLengthLabel() {
        contentLengthLabel.text = "\(textView.text.count)/777"
        contentLengthLabel.textColor = textView.text.count > 777 ? UIColor.systemRed : UIColor.secondaryLabel
    }
}

