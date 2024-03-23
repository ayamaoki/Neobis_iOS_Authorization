
import UIKit

class ResendAlertViewController: UIViewController {
    
    let contentView = ResendAlertView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        setupConstraintsResendAlertView()
        addTargets()
    }
    
    private func setupConstraintsResendAlertView() {
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addTargets() {
        contentView.okayButton.addTarget(self, action: #selector(okayButton), for: .touchUpInside)
    }
    
    @objc func okayButton() {
        dismiss(animated: true, completion: nil)
    }
}
