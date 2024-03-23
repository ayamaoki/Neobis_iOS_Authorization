//
//  ProfileViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 9/3/24.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let contentView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerNavigation()
        view.addSubview(contentView)
        setupConstraintsRegisterView()
        addTargets()
    }
    
    func setupConstraintsRegisterView(){
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func registerNavigation() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popBack))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func addTargets() {
        contentView.logoutButton.addTarget(self, action: #selector(logoutButton), for: .touchUpInside)
    }
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func logoutButton(){
        print("Logout button tapped")
        
        let logoutAlertViewController = LogoutAlertViewController()
        logoutAlertViewController.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(logoutAlertViewController, animated: false)
    }
}

