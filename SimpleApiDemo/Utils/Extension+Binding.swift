//
//  Extension+Binding.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 01/09/22.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
