//
//  CustomCheckbox.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 28/09/22.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  @Environment(\.isEnabled) var isEnabled
  let style: Style // custom param

  func makeBody(configuration: Configuration) -> some View {
    Button(action: {
      configuration.isOn.toggle() // toggle the state binding
    }, label: {
      HStack {
        Image(systemName: configuration.isOn ? "checkmark.\(style.sfSymbolName).fill" : style.sfSymbolName)
          .imageScale(.large)
        configuration.label
      }
    })
    .buttonStyle(PlainButtonStyle()) // remove any implicit styling from the button
    .disabled(!isEnabled)
  }

  enum Style {
    case square, circle

    var sfSymbolName: String {
      switch self {
      case .square:
        return "square"
      case .circle:
        return "circle"
      }
    }
  }
}


//Toggle("Checkbox 1", isOn: $isOn1)
//  .toggleStyle(CheckboxToggleStyle(style: .square))
//  .foregroundColor(.blue)
//
//Toggle("Checkbox 2", isOn: $isOn2)
//  .toggleStyle(CheckboxToggleStyle(style: .circle))
//  .foregroundColor(.red)
