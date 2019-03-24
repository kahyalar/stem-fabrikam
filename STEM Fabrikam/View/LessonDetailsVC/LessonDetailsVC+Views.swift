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
    lazy var pdfView: PDFView = {
        let view = PDFView()
        view.autoScales = true
        view.displayMode = .singlePage
        view.displayDirection = .vertical
        return view
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
        
        addSubview(pdfView)
        pdfView.layout {
            $0.top == videoView.bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.bottom == safeBottomAnchor
        }
    }
}
