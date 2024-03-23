//
//  ConfirmViewModel.swift
//  Neobis_iOS_Authorization
//
//

import Foundation

protocol ConfirmViewModelProtocol {
    func sendLink(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void)
}

class ConfirmViewModel: ConfirmViewModelProtocol {
    let url = "https://berlin-backender.org.kg/api/request-reset-email"
    
    func sendLink(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void) {
        let bodyParametrs = ["email": email, "username": username, "password": password]
        let headerParameters = ["Content-Type": "application/json"]
        
        NetworkManager.request(urlString: url,method: .post ,parameters: bodyParametrs, headers: headerParameters, completion: complition)
    }
}
