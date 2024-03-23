//
//  RegisterViewModel.swift
//  Neobis_iOS_Authorization
//

import Foundation

protocol RegisterViewModelProtocol {
    
    func registerUser(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void)
}

class RegisterViewModel: RegisterViewModelProtocol {
    
    let url = "https://berlin-backender.org.kg/api/register/email"
    
    func registerUser(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void) {
        let bodyParameters = ["email": email, "username": username, "password": password]
        let headerParameters = ["Content-Type": "application/json"]
        
        NetworkManager.request(urlString: url,method: .post ,parameters: bodyParameters, headers: headerParameters, completion: complition)
    }
}
