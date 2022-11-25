//
//  LoginRequest.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 22/08/22.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail, userPassword: String
}
