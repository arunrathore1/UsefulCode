//
//  UIApplication.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 01/09/22.
//

import Foundation
import SwiftUI

extension UIApplication {

    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

