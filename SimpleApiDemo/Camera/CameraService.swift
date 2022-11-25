//
//  CameraService.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 06/09/22.
//

import Foundation
import AVFoundation

class CameraService: ObservableObject{
  var session: AVCaptureSession?
  
  let previewLayer = AVCaptureVideoPreviewLayer()
  
  func setUpCamera(){
    let session = AVCaptureSession()
    if let device = AVCaptureDevice.default(for: .video){
      do{
        let input = try AVCaptureDeviceInput(device: device)
        if(session.canAdd
           Input(input)){
          session.addInput(input)
        }
        
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.session = session
        
        
        session.startRunning()
        self.session = session
      }catch{
        print(error)
      }
    }
  }
}
