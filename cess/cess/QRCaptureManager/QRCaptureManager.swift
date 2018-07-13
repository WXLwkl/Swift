//
//  QRCaptureManager.swift
//  cess
//
//  Created by xingl on 2018/5/24.
//  Copyright © 2018年 xingl. All rights reserved.
//

import UIKit
import AVFoundation

class QRCaptureManager: NSObject {
    
    static let shared = QRCaptureManager()

    private let captureSession = AVCaptureSession()
    private let videoPreviewLayer = AVCaptureVideoPreviewLayer()
    private let metadataOutput = AVCaptureMetadataOutput()
    
    private var handleCompleted: ((String) -> ())? = nil
    
    private override init() {
        super.init()
        
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { (isSuccess) in
            if isSuccess {
                self.prepare()
            } else {
                print("无权访问摄像头")
            }
        }
    }
    
    deinit {
        // dealloc
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    private func prepare() {
        guard let device = AVCaptureDevice.default(for: .video) else { return print("获取摄像设备发生错误") }
        guard let deviceInput = try? AVCaptureDeviceInput(device: device) else { return print("创建设备输入流发生错误") }
        // 创建数据输出流
        //        let metadataOutput = AVCaptureMetadataOutput()
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        // 创建设备输出流
        let videoDataOutput = AVCaptureVideoDataOutput()
        videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue.main)
        
        // 会话采集率
        captureSession.canSetSessionPreset(AVCaptureSession.Preset.high)
        
        // 添加数据输出流到会话对象
        captureSession.addInput(deviceInput)
        // 添加数据输出流到会话对象
        captureSession.addOutput(metadataOutput)
        // 添加设备输出流到会话对象
        captureSession.addOutput(videoDataOutput)
        // 设置数据输出类型
        metadataOutput.metadataObjectTypes = [
            AVMetadataObject.ObjectType.qr,
            .code39,
            .code93,
            .code128,
            .code39Mod43,
            .ean13,
            .ean8
        ]
        
        videoPreviewLayer.session = captureSession;
        videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
    }
    
    //    func rectOfInterest(_ rect: CGRect) -> Self {
    //        //设置扫描区域
    //        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: nil) { (notify) in
    //            // 设置扫描范围（每一个取值0～1，以屏幕右上角为坐标原点）
    //            // 注：微信二维码的扫描范围是整个屏幕（下面这句可注释掉）;
    //            self.metadataOutput.rectOfInterest = self.videoPreviewLayer.metadataOutputRectConverted(fromLayerRect: rect)
    //            print(self.metadataOutput.rectOfInterest)
    //        }
    //        return self;
    //    }
    //
    func scan(design: @escaping (_ previewLayer: AVCaptureVideoPreviewLayer, _ metadataOutput: AVCaptureMetadataOutput) -> ()) -> Self {
        design(videoPreviewLayer, metadataOutput)
        startRunning()
        return self;
    }
    
    func completed(aCompleted: @escaping (_ value: String) ->()) {
        self.handleCompleted = aCompleted
    }
    
    func startRunning() {
        if captureSession.isRunning { return }
        captureSession.startRunning()
    }
    func stopRunning() {
        print(captureSession.isRunning)
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
    }
}

extension QRCaptureManager: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        guard metadataObjects.count > 0 else { return }
        
        captureSession.stopRunning()
        guard let stringValue = metadataObjects.first!.value(forKey: "stringValue") as? String else {
            return print("无内容")
        }
        handleCompleted?(stringValue)
    }
}

extension QRCaptureManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
    }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
    }
}

