//
//  LessonDetailsVC+Views.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 24.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit
import PDFKit
import AVFoundation

class LessonDetailsViews: View {
    weak var rootView: LessonDetailsVC!
    lazy var videoView = UIView()
    lazy var videoControlsView = UIView()
    lazy var pdfView: PDFView = {
        let view = PDFView()
        view.autoScales = true
        view.displayMode = .singlePage
        view.displayDirection = .vertical
        return view
    }()
    lazy var loadingView = UIActivityIndicatorView(style: .whiteLarge)
    lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: "pause"), for: .normal)
        return button
    }()
    
    override func layoutViews() {
        super.layoutViews()
        
        addSubview(videoView)
        videoView.backgroundColor = .black
        videoView.layout {
            $0.top == safeTopAnchor
            $0.width == UIScreen.main.bounds.width
            $0.height == UIScreen.main.bounds.width * (9 / 16)
        }
        
        addSubview(videoControlsView)
        videoControlsView.backgroundColor = .black
        videoControlsView.layout {
            $0.top == safeTopAnchor
            $0.width == UIScreen.main.bounds.width
            $0.height == UIScreen.main.bounds.width * (9 / 16)
        }
        
        videoControlsView.addSubview(loadingView)
        loadingView.layout {
            $0.centerX == videoControlsView.centerXAnchor
            $0.centerY == videoControlsView.centerYAnchor
            loadingView.startAnimating()
        }
        
        videoControlsView.addSubview(playPauseButton)
        playPauseButton.layout {
            $0.centerX == videoControlsView.centerXAnchor
            $0.centerY == videoControlsView.centerYAnchor
            $0.width == UIScreen.main.bounds.width * 0.15
            $0.height == UIScreen.main.bounds.width * 0.15
        }
        
        addSubview(pdfView)
        pdfView.layout {
            $0.top == videoView.bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.bottom == safeBottomAnchor
        }
    }
}
