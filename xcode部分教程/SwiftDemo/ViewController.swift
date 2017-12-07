//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xingl on 2016/10/25.
//  Copyright © 2016年 yjpal. All rights reserved.
//

import UIKit

import CoreImage

import AudioToolbox
import AVFoundation

import MediaPlayer

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "2")
//        灰度图
//        let grayedImage = self.grayImage(image: image!)
//        
//        
//        let imageV = UIImageView(image: grayedImage)
//        
//        imageV.center = CGPoint(x: 160, y: 260)
//        
//        view.addSubview(imageV)
        
        //单色效果
//        let ciImage = self.getCIImage(image: image!)
//        更改图片的色相
//        let ciImage = self.getCIImage1(image: image!)
//        马赛克效果
//        let ciImage = self.getCIImage2(image: image!)
//        imageV.image = UIImage(ciImage: ciImage)
        
        
//        模糊效果
//        fuzzyImage()
//        获取系统内置滤镜名称
//        getSystemFilters()
        
//        渐显动画
//        makeAnimation()
//        入场动画
//        makeAnimation2()
//        翻转动画
//        makeAnimation3()
//        帧动画
//        makeAnimation4()
        
//        sound()
//        music()
//        backgroundMusic()
        
        
        videoPlay()
    }
//MARK: - 使用图形上下文转换图片为灰度图
//    1
    func grayImage(image: UIImage) -> UIImage {
        
        let imageSize = image.size
        let width = Int(imageSize.width)
        let height = Int(imageSize.height)
        
//        创建灰度色彩空间对象
        let spaceRef = CGColorSpaceCreateDeviceGray()
//        参数1，指向要渲染的绘制内存的地址； 参数2、3，分别表示宽度和高度；参数4，表示内存中像素的内阁组件的位数；参数5，表示每一行在内存所占的比特数；参数6，表示上下文使用的颜色空间；参数7，表示是否包含alpha通道，然后创建一个和源图像同样尺寸的空间
        let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: spaceRef, bitmapInfo: CGBitmapInfo().rawValue)!
        
        let rect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
//        在灰度上下文中画入图片
        context.draw(image.cgImage!, in: rect)
//        从上下文中，获取并生成转为灰度的图片
        let grayImage = UIImage(cgImage: context.makeImage()!)
        
        return grayImage
    }
    
//MARK: - 使用coreImage框架设置图片的单色效果
    func getCIImage(image: UIImage) -> CIImage {
//        初始化CoreImage对象
        let ciImage = CIImage(image: image)
//        初始化一个颜色对象，并设置颜色
        let color = CIColor(red: 0.8, green: 0.6, blue: 0.4)
//        初始化一个滤镜对象，并设置滤镜类型为单色调滤镜
        let filter = CIFilter(name: "CIColorMonochrome")
//        设置单色调滤镜的输入颜色值
        filter?.setValue(color, forKey: kCIInputColorKey)
//        设置 颜色浓度值
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
//        设置需要应用单色调滤镜的图像
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
//        获得应用单色调滤镜后的图像
        let outImage = filter?.outputImage
        return outImage!
    }

    
//MARK: - 使用coreImage框架更改图片的色相
    func getCIImage1(image: UIImage) -> CIImage {
        
        let ciImage = CIImage(image: image)
//        初始化一个滤镜对象，并设置滤镜类型为色相调整滤镜
        let filter = CIFilter(name: "CIHueAdjust")
//        设置色相调整滤镜的输入角度值为30度
        filter?.setValue(3.14/6, forKey: kCIInputAngleKey)
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        let outImage = filter?.outputImage
        return outImage!
    }
    
    
//MARK: - 使用coreImage框架添加马赛克效果
    func getCIImage2(image: UIImage) -> CIImage {
        
        let ciImage = CIImage(image: image)
//        初始化一个滤镜对象，并设置滤镜类型为像素滤镜
        let filter = CIFilter(name: "CIPixellate")
//        设置像素化滤镜，采用默认的配置选项
        filter?.setDefaults()

        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        let outImage = filter?.outputImage
        return outImage!
    }
    
//MARK: - 使用UIBlurEffect给图片添加模糊效果
    func fuzzyImage() {
        
        let image = UIImage(named: "1")
        let imageV = UIImageView(image: image)
        view.addSubview(imageV)
        
        if #available(iOS 8.0, *) {
//        初始化一个模糊效果对象。模糊效果对象可以快速制作类似于导航栏、通知中心或者控制中心的毛玻璃效果。
            let blur = UIBlurEffect(style: .light)
//            初始化一个基于模糊效果的视觉效果视图
            let blurView = UIVisualEffectView(effect: blur)
            blurView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            blurView.layer.cornerRadius = 30
            blurView.layer.masksToBounds = true
            imageV.addSubview(blurView)
        } else {
            print("UIBlurEffect is only available on iOS 8.0 or newer!")
        }
    }

//MARK: - 获取系统内置滤镜名称
    func getSystemFilters() {
        
//        获取系统内置滤镜名称，并将滤镜名称放置到数组中
        let builtInFilters = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
        
        for filter in builtInFilters {
            let filter = CIFilter(name: filter as String)
//            获得滤镜所有属性
            let attributes = filter!.attributes
            
            print("\(filter)--->")
            print(attributes)
            print("\n -------------")
        }
        
        
    }
    
//MARK: - 使用CATransaction Reveal制作动画 渐显动画
    func makeAnimation() {
        
        let rect = CGRect(x: 0, y: 100, width: 320, height: 211)
        let imageView = UIImageView(frame: rect)
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "1")
        imageView.image = image
        
        view.addSubview(imageView)
        
        let animation = CATransition()
        animation.duration = 2
//        设置动画播放速度为 由慢至快
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        设置动画的类型为 渐显动画
        animation.type = kCATransitionReveal
        
        imageView.layer.add(animation, forKey: "Reveal")
    }
    
    
//MARK: - 使用CATransaction Push制作动画 入场动画
    func makeAnimation2() {
        
        let rect = CGRect(x: 0, y: 100, width: 320, height: 211)
        let imageView = UIImageView(frame: rect)
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "1")
        imageView.image = image
        
        view.addSubview(imageView)
        
        let animation = CATransition()
        animation.duration = 2
//        设置动画播放速度为 由慢至快
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        设置动画的类型为 渐显动画
        animation.type = kCATransitionPush
        
        imageView.layer.add(animation, forKey: "Push")
    }
    
//MARK: - UIView视图的动画块 翻转动画
    func makeAnimation3() {
        
        let rect  = CGRect(x: 50, y: 50, width: 220, height: 220)
        let imageV = UIImageView(frame: rect)
        let image = UIImage(named: "1")
        imageV.image = image
        view.addSubview(imageV)
        imageV.tag = 1
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 50, y: 400, width: 220, height: 44)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Tap", for: UIControlState())
        button.addTarget(self, action: #selector(ViewController.playAnimation), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
//    func playAnimation() {
//        
//        UIView.beginAnimations(nil, context: nil)
////        设置动画播放的速度为淡入淡出
//        UIView.setAnimationCurve(.easeOut)
//        UIView.setAnimationDuration(3)
////        设置动画从视图当前状态开始播放
//        UIView.setAnimationBeginsFromCurrentState(true)
//        let view = self.view.viewWithTag(1)
//        
////        UIView.setAnimationTransition(.flipFromRight, for: view!, cache: true)
////        卷曲动画
//        UIView.setAnimationTransition(.curlUp, for: view!, cache: true)
//        UIView.commitAnimations()
//    }
    
    func playAnimation() {
        
        UIView.beginAnimations(nil, context: nil)
        //        设置动画播放的速度为淡入淡出
        UIView.setAnimationCurve(.easeOut)
        UIView.setAnimationDuration(3)
        //        设置动画从视图当前状态开始播放
        UIView.setAnimationBeginsFromCurrentState(true)
        let view = self.view.viewWithTag(1)
        UIView.setAnimationTransition(.flipFromRight, for: view!, cache: true)
        
        view?.frame = CGRect(x: 50, y: 50, width: 0, height: 0)
        
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(ViewController.animatonStop))
        
        UIView.commitAnimations()
    }
    func animatonStop() {
        print("Animaton stop.")
        let view = self.view.viewWithTag(1)
        view?.removeFromSuperview()
    }
    
    
//    帧动画
    func makeAnimation4() {
        
        var images = [UIImage]()
        for i in 1...7 {
            images.append(UIImage(named: "campFire\(i)")!)
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 60, width: 335, height: 253))
        imageView.animationImages = images
        imageView.animationDuration = 2
//        设置动画循环次数，0为无限循环
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        
        self.view.addSubview(imageView)
    }
    
    func sound(){
        
        var _soundId: SystemSoundID = 0
        let path = Bundle.main.path(forResource: "aa", ofType: "wav")
//        将字符串路径转换为网址路径
        let soundUrl = URL(fileURLWithPath: path!)
        
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &_soundId)
        AudioServicesPlaySystemSound(_soundId)
    }
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    func music() {
        
        let path = Bundle.main.path(forResource: "chuanqi", ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
//            设置音量大小
            audioPlayer.volume = 0.5
//            设置音频播放的次数，-1为无限循环
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
        } catch {
            print(error)
        }
        
    }
    /*
    需要在info.plist文件中间距键值对。
    Required background modes 
          App plays audio or streams audio/video using AirPlay
    */
    func backgroundMusic() {
        
        let session = AVAudioSession.sharedInstance()
        do {
//            启动音频会话管理，此时会阻断后台音乐的播放
            try session.setActive(true)
//            设置音频操作类别，表示该应用仅支持音频的播放
            try session.setCategory(AVAudioSessionCategoryPlayback)
//            设置应用程序支持接受远程控制事件
            UIApplication.shared.beginReceivingRemoteControlEvents()
            
            let path = Bundle.main.path(forResource: "chuanqi", ofType: "mp3")
            let soundUrl = URL(fileURLWithPath: path!)
            
//            对音频播放对象进行初始化，并加载指定的音频文件
            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
//            为音频播放做好准备
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 1.0
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            
        } catch {
            print(error)
        }
        
    }

//    新建一个视频播放控制属性，用于播放视频
    var mediaPlayer:MPMoviePlayerController = MPMoviePlayerController()
    
    func videoPlay() {
        
        let path = Bundle.main.path(forResource: "1", ofType: "mp4")
        let movieUrl = URL(fileURLWithPath: path!)

        do {
            
            mediaPlayer = MPMoviePlayerController(contentURL: movieUrl)
//            设置视频播放模式为全屏播放
            mediaPlayer.controlStyle = MPMovieControlStyle.fullscreen
            mediaPlayer.view.frame = self.view.bounds
//            设置视频播放的开始时间
            mediaPlayer.initialPlaybackTime = -1
            
            self.view.addSubview(mediaPlayer.view)
            
            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.movieFinished(notify:)), name: .MPMoviePlayerPlaybackDidFinish, object: mediaPlayer)
            mediaPlayer.play()
        } catch {
            print(error)
        }
    }
    
    func movieFinished(notify: Notification) {
        print("movie ends")
        let player = notify.object
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: player)
    }
    
    
    
    
    
    

}

