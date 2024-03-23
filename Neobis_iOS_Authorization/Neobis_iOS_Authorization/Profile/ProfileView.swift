//
//  ProfileView.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 9/3/24.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "С возвращением!"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 25)
        label.textAlignment = .center
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorby - твой личный репетитор"
        label.font = UIFont(name: "MPLUS1p-Regular", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    let viewImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lorby")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        let buttonTitle = "Выйти"
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backgroundColor = .white
        
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(viewImage)
        addSubview(logoutButton)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(UIScreen.main.bounds.height * 0.2)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        viewImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(30)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(60)
            make.height.equalTo(viewImage.snp.width)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(60)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
}


