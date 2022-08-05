import Foundation
import UIKit

final class PostTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var repostLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption2)
        label.textColor = .secondaryLabel
        label.text = "reposted"

        return label
    }()

    private lazy var profileImage: UIImage? = {
        let image = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal)

        return image
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: profileImage?.withTintColor(.purple))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .footnote).withSymbolicTraits(.traitBold)!
        label.font = UIFont(descriptor: descriptor, size: .zero)

        return label
    }()

    private lazy var postTextLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .label

        return label
    }()

    private lazy var rightContentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [repostLabel, usernameLabel, postTextLabel, UIView()])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fill

        return stack
    }()

    enum LayoutMetrics {
        static let profileImageCellWidthMultiplier: CGFloat = 0.15

        static let minimumCellHeight: CGFloat = UIScreen.main.bounds.height / 10
    }
}

// MARK: - ReusableView

extension PostTableViewCell: ReusableView {
    func configure(with post: Post, originalPost: Post? = nil) {
        repostLabel.alpha = post.type == .quote ? 1 : 0
        usernameLabel.text = "@\(post.author.username)"
        postTextLabel.text = post.content
    }
}

// MARK: - CodedViewLifecycle

extension PostTableViewCell: CodedViewLifecycle {
    func addSubviews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(rightContentStackView)
    }

    func constrainSubviews() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: LayoutMetrics.minimumCellHeight),

            profileImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            profileImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: LayoutMetrics.profileImageCellWidthMultiplier),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),

            rightContentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: profileImageView.trailingAnchor, multiplier: 1),
            rightContentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rightContentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rightContentStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
}
