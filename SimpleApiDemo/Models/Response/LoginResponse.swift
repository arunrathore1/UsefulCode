//
//  LoginResponse.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 22/08/22.
//

import Foundation

struct LoginResponse: Decodable {
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable {
    let userName, email: String
    let userId: Int
}
