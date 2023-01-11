//
//  TorchFunc.swift
//  LightTimer
//
//  Created by Home on 11.01.2023.
//

import UIKit
import AVFoundation

func torchOff() {
    guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            device.torchMode = AVCaptureDevice.TorchMode.off
            device.unlockForConfiguration()
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
}

func torchON() {
    guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
    
    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            device.torchMode = AVCaptureDevice.TorchMode.on
            device.unlockForConfiguration()
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
}
