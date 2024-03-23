//
//  LoginViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 28/2/24.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let contentView = LoginView()
    
    var loginViewModel: LoginViewModelProtocol?
    init(loginViewModel: LoginViewModelProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.loginViewModel = loginViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerNavigation()
        setupLoginRequest()
        contentView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        contentView.newAccountButton.addTarget(self, action: #selector(newAccountTapped), for: .touchUpInside)
    }
    
    func setupView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func registerNavigation() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popBack))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func setupLoginRequest() {
        loginViewModel?.checkUserData = { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let refreshToken):
                    print("Success: \(refreshToken.refresh)")
                    let vc = UINavigationController(rootViewController: ProfileViewController())
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @objc func enterButtonTapped() {
        print("login button tapped")
        guard let username = contentView.usernameTextField.text,
              let password = contentView.passwordTextField.text
        else {
            print("Invalid input")
            return
        }
       
        loginViewModel?.loginUser(username: username, password: password)
    }
    
    @objc func newAccountTapped() {
        let viewController = UINavigationController(rootViewController: RegisterViewController(viewModel: RegisterViewModel()))
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
}
