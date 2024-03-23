//
//  RegisterView.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 3/3/24.
//

import UIKit
import SnapKit

class RegisterView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Создать аккаунт\nLorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Введи адрес почты"
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 11
        return textField
    }()
    
    let usernameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Придумай логин"
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 11
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Создай пароль"
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 11
        textField.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1.0)
        textField.isSecureTextEntry = true
        textField.returnKeyType = .search
        
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.setImage(UIImage(named: "eye-disable"), for: .selected)
        button.setImage(UIImage(named: "eye"), for: .normal)
        button.frame = CGRect(x: CGFloat(textField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(togglePasswordVisible), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        return textField
    }()
    
    let firstPasswordRequirement: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.text = "· От 8 до 15 символов"
        label.textColor = .systemGray
        return label
    }()
    
    let secondPasswordRequirement: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.text = "· Строчные и прописные буквы"
        label.textColor = .systemGray
        return label
    }()
    
    let thirdPasswordRequirement: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.text = "· Минимум 1 цифра"
        label.textColor = .systemGray
        return label
    }()
    
    let fourthPasswordRequirement: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.text = "· Минимум 1 спецсимвол(!,#,$,...)"
        label.textColor = .systemGray
        return label
    }()
    
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пoвтори пароль"
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 11
        textField.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1.0)
        textField.isSecureTextEntry = true
        textField.returnKeyType = .search
        
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.setImage(UIImage(named: "eye-disable"), for: .selected)
        button.setImage(UIImage(named: "eye"), for: .normal)
        button.frame = CGRect(x: CGFloat(textField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(togglePasswordRepeatVisible), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        return textField
        
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Bold", size: 16)
        button.layer.cornerRadius = 16
        button.backgroundColor = .black
        return button
        
    }()
    
    let passwordNotMatchLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароли не совпадают"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemRed
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @objc func togglePasswordVisible(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc func togglePasswordRepeatVisible(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        repeatPasswordTextField.isSecureTextEntry = !repeatPasswordTextField.isSecureTextEntry
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(firstPasswordRequirement)
        addSubview(secondPasswordRequirement)
        addSubview(thirdPasswordRequirement)
        addSubview(fourthPasswordRequirement)
        addSubview(passwordNotMatchLabel)
        addSubview(nextButton)
        addSubview(repeatPasswordTextField)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.top.equalToSuperview().offset(140)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(usernameTextField.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        firstPasswordRequirement.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
        }
        
        secondPasswordRequirement.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(firstPasswordRequirement.snp.bottom).offset(14)
        }
        
        thirdPasswordRequirement.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(secondPasswordRequirement.snp.bottom).offset(14)
        }
        
        fourthPasswordRequirement.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(thirdPasswordRequirement.snp.bottom).offset(14)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(fourthPasswordRequirement.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        passwordNotMatchLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(5)
        }
        
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}


