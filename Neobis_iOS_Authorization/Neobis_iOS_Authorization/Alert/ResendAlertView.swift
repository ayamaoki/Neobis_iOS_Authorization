
import Foundation
import UIKit
import SnapKit

class ResendAlertView: UIView {
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы выслали еще одно письмо на указанную тобой почту example@gmail.com"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "MPLUS1p-Medium", size: 20)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Не забудь проверить \n ящик “Спам”!11!!!!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        label.textColor = .systemGray4
        return label
    }()
    
    lazy var okayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Понятно!!1!", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(subtitleLabel)
        addSubview(okayButton)
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
        
        okayButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
