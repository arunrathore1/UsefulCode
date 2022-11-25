//
//  ViewRouter.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 01/09/22.
//

import SwiftUI

class ViewRouter: ObservableObject {

    @Published var currentPage: Page = .home
}
enum Page {
    case home
    case liked
    case records
    case user
}
