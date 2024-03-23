//
//  LoginView.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 28/2/24.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView, UITextFieldDelegate {
    
    let loginImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "earth")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Вэлком Бэк!"
        label.font = UIFont(name: "MPLUS1p-Bold", size: 25)
        label.textAlignment = .center
        return label
    }()
    
    let usernameTextField: CustomTextField = {
       let textField = CustomTextField()
        textField.placeholder = "Введи туда-сюда логин"
        textField.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1.0)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 11
        textField.returnKeyType = .search
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Пароль (тоже введи)"
        textField.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1.0)
        textField.isSecureTextEntry = true
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 11
        textField.returnKeyType = .search
        
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.setImage(UIImage(named: "eye"), for: .normal)
        button.setImage(UIImage(named: "eye-disable"), for: .selected)
        button.frame = CGRect(x: CGFloat(textField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(togglePasswordVisible), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        return textField
    }()
    
    let enterButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 11
        let buttonText = "Войти"
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Bold", size: 16)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    let newAccountButton: UIButton = {
       let button = UIButton()
       let buttonText = "У меня  еще нет аккаунта"
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Bold", size: 16)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backgroundColor = .white
        
        setupView()
        setupConstraints()
    }
    
    @objc func togglePasswordVisible(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    func setupView() {
        addSubview(loginImage)
        addSubview(welcomeLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(newAccountButton)
    }
    
    func setupConstraints() {
        loginImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(195)
            make.width.equalTo(185)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginImage.snp.bottom).offset(31)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(usernameTextField.snp.bottom).offset(15)
            make.height.equalTo(52)
            make.width.equalTo(360)
        }
        
        enterButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(26)
            make.height.equalTo(50)
        }
        
        newAccountButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(enterButton.snp.bottom).offset(28)
            make.height.equalTo(50)
        }
    }
}
