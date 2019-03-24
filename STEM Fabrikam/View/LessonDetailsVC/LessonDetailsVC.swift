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
    var isPlaying = true
    var isPlayPauseButtonDisplaying = true
    var lesson: Lesson!
    var videoPlayer: AVPlayer!
    
    deinit {
        videoPlayer.pause()
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        setVideoPlayer()
        setVideoControls()
        setPDFFile()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges" {
            handleUIAfterVideoLoaded()
        }
    }
    
    @objc func tapPlayPauseButton(){
        if isPlaying {
            isPlaying = false
            videoPlayer.pause()
            customView.playPauseButton.setBackgroundImage(UIImage(named: "play"), for: .normal)
            
        } else {
            isPlaying = true
            videoPlayer.play()
            customView.playPauseButton.setBackgroundImage(UIImage(named: "pause"), for: .normal)
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if !isPlayPauseButtonDisplaying {
            customView.playPauseButton.isHidden = false
            isPlayPauseButtonDisplaying = true
        } else {
            customView.playPauseButton.isHidden = true
            isPlayPauseButtonDisplaying = false
        }
    }
    
    @objc func detectFinish(){
        isPlaying = false
        customView.playPauseButton.isHidden = false
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
        videoPlayer = AVPlayer(url: URL(string: lesson.video)!)
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        customView.videoView.frame = CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.frame.width)!, height: (UIApplication.shared.keyWindow?.frame.width)! * (9 / 16))
        customView.videoView.layer.addSublayer(playerLayer)
        playerLayer.frame = customView.videoView.frame
        videoPlayer.play()
        videoPlayer.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(detectFinish), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    private func setVideoControls(){
        customView.videoControlsView.frame = CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.frame.width)!, height: (UIApplication.shared.keyWindow?.frame.width)! * (9 / 16))
        customView.playPauseButton.addTarget(nil, action: #selector(tapPlayPauseButton), for: .touchUpInside)
        customView.videoControlsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:))))
    }
    
    private func handleUIAfterVideoLoaded(){
        customView.loadingView.stopAnimating()
        customView.videoControlsView.backgroundColor = .clear
    }
}
