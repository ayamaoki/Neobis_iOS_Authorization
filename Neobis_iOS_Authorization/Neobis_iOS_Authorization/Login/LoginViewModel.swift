//
//  LoginViewModel.swift
//  Neobis_iOS_Authorization
//

import Foundation

protocol LoginViewModelProtocol {
    var checkUserData: ((Result<TokenRefresh, NetworkError>) -> Void)? { get set }
    func loginUser(username: String, password: String)
}

class LoginViewModel: LoginViewModelProtocol {
    private let loginURL = "https://berlin-backender.org.kg/api/login"
    
    var checkUserData: ((Result<TokenRefresh, NetworkError>) -> Void)?
    
    func loginUser(username: String, password: String) {
        let bodyParameters = ["username": username, "password": password]
        let headerParameters = ["Content-Type": "application/json"]
        if let checkUserData = checkUserData {
            NetworkManager.request(urlString: loginURL,method: .post ,parameters: bodyParameters, headers: headerParameters, completion: checkUserData)
        }
    }
}
