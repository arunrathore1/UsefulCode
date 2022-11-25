//
//  String.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 01/09/22.
//

import Foundation

extension String {

  var removingHTMLOccurances: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
  }

  var isValidEmail: Bool {
    let name = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    let domain = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    let emailRegEx = name + "@" + domain + "[A-Za-z]{2,8}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailPredicate.evaluate(with: self)
  }

  var isValidPassword: Bool {
    let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
    return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
  }

  var isValidName: Bool {
        let RegEx = "^\\w{7,18}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: self)
     }
}

//import Foundation
//
////MARK:- String Extension
//extension String {
//    func isValidEmail() -> Bool {
//        // here, `try!` will always succeed because the pattern is valid
//        let regex = try! NSRegularExpression(pattern: "^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]{1}|[\\w-]{2,}))@"
//                                             + "((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?"
//                                             + "[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\."
//                                             + "([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?"
//                                             + "[0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
//                                             + "([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})$", options: .caseInsensitive)
//        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
//    }
//
//
//    func isValidPassword() -> Bool {
//        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
//        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
//        return passwordValidation.evaluate(with: self)
//    }
//}
//
//
