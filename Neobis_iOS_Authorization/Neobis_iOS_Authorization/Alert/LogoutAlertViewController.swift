//
//  LogOutAlertController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 9/3/24.
//

import UIKit

class LogoutAlertViewController: UIViewController {
    
    let contentView = LogoutAlert()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        setupConstraintsLogoutAlertView()
        addTargets()
    }
    
    private func setupConstraintsLogoutAlertView() {
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addTargets() {
        contentView.yesLogoutButton.addTarget(self, action: #selector(didTapYesLogoutButton), for: .touchUpInside)
        contentView.stayButton.addTarget(self, action: #selector(didTapStayButton), for: .touchUpInside)
    }
    
    @objc func didTapYesLogoutButton(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapStayButton() {
        dismiss(animated: true, completion: nil)
    }
}
