//
//  ActivityIndecatorView.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 01/09/22.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
  
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let view = UIActivityIndicatorView(style: .large)
    view.startAnimating()
    return view
  }
}
