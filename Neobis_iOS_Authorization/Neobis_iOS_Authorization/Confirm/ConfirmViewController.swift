//
//  ConfirmViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 9/3/24.
//

import Foundation
import UIKit
import SnapKit

class ConfirmViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let viewModel: ConfirmViewModelProtocol?
    let email: String?
    let username: String?
    let password: String?
    
    let contentView = ConfirmView(frame: UIScreen.main.bounds)
    
    init(email: String? = nil, username: String? = nil, password: String? = nil, viewModel: ConfirmViewModelProtocol? = nil) {
        self.email = email
        self.username = username
        self.password = password
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        contentView.titleLabel.text = "Выслали письмо со ссылкой\nдля завершения регистрации\nна \(email)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigation()
        view.addSubview(contentView)
        setupView()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func navigation() {
        navigationItem.title = "Регистрация"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "back"),
            style: .plain,
            target: self,
            action: #selector(popBack))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func addTargets() {
        contentView.resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
    }
    
    func sendConfirmationRequest() {
        if let email = email, let username = username, let password = password {
            viewModel?.sendLink(email: email, username: username, password: password, complition: { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let resultt):
                        print(resultt)
                    case .failure(let error):
                        print(error)
                    }
                }
            })
        }
    }
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func resendButtonTapped() {
        print("yahooo")
        let resendAlertViewController = ResendAlertViewController()
        resendAlertViewController.modalPresentationStyle = .overFullScreen
        present(resendAlertViewController, animated: false)
        sendConfirmationRequest()
    }
}
