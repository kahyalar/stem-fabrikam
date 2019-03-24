//
//  LessonDetailsVC.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 24.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit
import PDFKit
import AVFoundation

class LessonDetailsVC: ViewController<LessonDetailsViews> {
    var lesson: Lesson!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        setVideoPlayer()
        setPDFFile()
    }
}

private extension LessonDetailsVC {
    private func setNavigationBarTitle(){
        navigationItem.title = lesson.title
    }
    
    private func setPDFFile(){
        let pdf = PDFDocument(url: URL(fileURLWithPath: Bundle.main.path(forResource: lesson.document, ofType: "pdf")!))!
        customView.pdfView.document = pdf
    }
    
    private func setVideoPlayer(){
//        let videoPlayer = AVPlayer(url: URL(string: lesson.video)!)
        let videoPlayer = AVPlayer(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726")!)
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        customView.videoView.frame = CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.frame.width)!, height: (UIApplication.shared.keyWindow?.frame.width)! * (9 / 16))
        customView.videoView.layer.addSublayer(playerLayer)
        playerLayer.frame = customView.videoView.frame
        videoPlayer.play()
    }
}
