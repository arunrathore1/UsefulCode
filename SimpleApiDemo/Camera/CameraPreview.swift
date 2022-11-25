//
//  CameraPreview.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 06/09/22.
//

import SwiftUI
import AVFoundation


struct CameraPreview: UIViewRepresentable{
  let cameraService: CameraService

  func makeUIView(context: Context) -> UIView {
    cameraService.setUpCamera()

    let view = UIView(frame: UIScreen.main.bounds)
    cameraService.previewLayer.frame = view.bounds

    view.layer.addSublayer(cameraService.previewLayer)
    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {
  }


  typealias UIViewType = UIView
}

