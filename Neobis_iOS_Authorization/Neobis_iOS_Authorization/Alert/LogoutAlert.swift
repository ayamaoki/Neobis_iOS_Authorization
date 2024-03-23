import Foundation
import UIKit
import SnapKit

class LogoutAlert: UIView {
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выйти?"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Medium", size: 20)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Точно выйти?"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        label.textColor = .systemGray4
        return label
    }()
    
    lazy var yesLogoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Да, точно", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var stayButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Нет, остаться", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        addSubview()
        setupConstraints()
    }
    
    func addSubview() {
        addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(subtitleLabel)
        addSubview(yesLogoutButton)
        addSubview(stayButton)
    }
    
    func setupConstraints() {
        
        alertView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(263)
            make.width.equalTo(343)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        yesLogoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(45)
            make.trailing.equalToSuperview().inset(45)
            make.height.equalTo(50)
        }
        
        stayButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(yesLogoutButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
