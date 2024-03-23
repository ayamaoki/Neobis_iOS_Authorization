//
//  RegisterViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 8/3/24.
//

import Foundation
import UIKit
import SnapKit

class RegisterViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let contentView =  RegisterView()
    
    var viewModel: RegisterViewModelProtocol?
    init(viewModel: RegisterViewModelProtocol?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        registerNavigation()
        addTarget()
        contentView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    func setupView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func registerNavigation() {
        navigationItem.title = "Регистрация"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popBack))
        navigationController?.interactivePopGestureRecognizer?.delegate = self

    }
    
    func addTarget() {
        contentView.passwordTextField.addTarget(self, action: #selector(createPassword), for: .editingChanged)
        contentView.repeatPasswordTextField.addTarget(self, action: #selector(confirmPassword), for: .editingChanged)
        contentView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func createPassword() {
        if let password = contentView.passwordTextField.text {
            validPassword(password)
        }
    }
    
    func validPassword(_ password: String) -> Bool {
        let requirements = [
            (contentView.firstPasswordRequirement, validLength(password)),
            (contentView.secondPasswordRequirement, hasLetters(password)),
            (contentView.thirdPasswordRequirement, hasNumber(password)),
            (contentView.fourthPasswordRequirement, specialCharacter(password))]

        for (label, requirementMet) in requirements {
            requirementLabel(label, requirement: requirementMet)
        }

        let allRequirements = requirements.allSatisfy { $0.1 }

        contentView.passwordTextField.textColor = allRequirements ? .black : .systemRed

        return allRequirements
    }
    
    func requirementLabel(_ label: UILabel, requirement: Bool) {
        
        var labelTitle = label.text ??  ""
        labelTitle = String(labelTitle.dropLast())
        
        if requirement {
            labelTitle += "✅"
            label.textColor = .systemGreen
        } else {
            labelTitle += "❌"
            label.textColor = .systemRed
        }
        
        label.text = labelTitle
    }
    
    func validLength(_ password: String) -> Bool {
        let length = password.count
        let maxLength = 15
        let minLength = 8
        return length >= minLength && length <= maxLength
    }
    
    func hasLetters(_ password: String) -> Bool {
        let lowercaseSet = CharacterSet.lowercaseLetters
        let uppercaseSet = CharacterSet.uppercaseLetters
        
        return password.rangeOfCharacter(from: lowercaseSet) != nil && password.rangeOfCharacter(from: uppercaseSet) != nil
    }
    
    func hasNumber(_ password: String) -> Bool {
        return password.contains { $0.isNumber }
    }
    
    func specialCharacter(_ password: String) -> Bool {
        let specialCharacterSet = CharacterSet(charactersIn: "@$!%*?&")
        return password.rangeOfCharacter(from: specialCharacterSet) != nil
    }
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func confirmPassword() -> Bool {
        let passwordsMatch = contentView.passwordTextField.text == contentView.repeatPasswordTextField.text
        
        contentView.repeatPasswordTextField.textColor = passwordsMatch ? .black : .systemRed
        contentView.passwordNotMatchLabel.isHidden = passwordsMatch
        
        return passwordsMatch
    }
    
    @objc func nextButtonTapped() {
        if let email = contentView.emailTextField.textField.text,
           let username = contentView.usernameTextField.textField.text,
           let password = contentView.passwordTextField.text {
            viewModel?.registerUser(email: email, username: username, password: password, complition:{ [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let resultt):
                        print(resultt)
                        let viewController = UINavigationController(rootViewController: ConfirmViewController(email: email, username: username, password: password, viewModel: ConfirmViewModel()))
                        viewController.modalPresentationStyle = .fullScreen
                        self?.present(viewController, animated: true)
                    case .failure(let error):
                        print(error)
                    }
                }
            })
        }
    }
    
}
