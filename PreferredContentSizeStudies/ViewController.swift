import UIKit

class ViewController: UIViewController {
    private let titleLabel: UILabel  = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.text = "Hello World!"
        label.textColor = .black
        
        return label
    }()

    private let iconImageView = UIImageView(image: UIImage(named: "rabbit"))
    
    private let bodyLabel: UILabel  = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "
        label.textColor = .blue
        
        return label
    }()
    
    private var iconImageViewWidthConstraint: NSLayoutConstraint?
    private var iconImageViewHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupAdditionalConfiguration()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setNonDynamicConstraints()
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel, [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        view.addSubview(iconImageView, [
            iconImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(bodyLabel, [
            bodyLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            bodyLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        setNonDynamicConstraints()
    }
    
    private func setNonDynamicConstraints() {
        view.updateConstraint(&iconImageViewWidthConstraint) {
            iconImageView.widthAnchor.constraint(equalToConstant: 150 * UserPreferences.shared.contentSizeScale)
        }
        
        view.updateConstraint(&iconImageViewHeightConstraint) {
            iconImageView.heightAnchor.constraint(equalToConstant: 100 * UserPreferences.shared.contentSizeScale)
        }
    }

    private func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}
