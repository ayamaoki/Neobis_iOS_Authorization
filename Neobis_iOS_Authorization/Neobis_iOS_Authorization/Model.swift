//
//  Model.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 17/3/24.
//

import Foundation

// MARK: - Login
struct Login: Codable {
    let email, password: String
}

// MARK: - Registration
struct Registration: Codable {
    let email, username, password: String
}

// MARK: - CustomResetPasswordEmailRequest
struct CustomResetPasswordEmailRequest: Codable {
    let email: String
}

struct TokenRefresh: Codable {
    let refresh: String
}
