//
//  CustomCorner.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 07/09/22.
//

import SwiftUI

struct CustomCorners: Shape {

  var corners: UIRectCorner
  var radius:CGFloat

  func path(in rect:CGRect) -> Path {

    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

    return Path(path.cgPath)
  }
}
