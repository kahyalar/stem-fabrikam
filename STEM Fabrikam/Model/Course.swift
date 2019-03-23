//
//  Course.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit
import PDFKit

struct Course {
    var playlist: URL
    var title: String
    var image: UIImage
    var lessons: [Lesson]
    
    init(title: String, image: String, playlist: String, lessons: [Lesson]) {
        self.title = title
        self.image = UIImage(named: image)!
        self.lessons = lessons
        self.playlist = URL(string: playlist)!
    }
}

struct Lesson {
    var video: URL
    var title: String
    var document: PDFDocument
    
    init(title: String, video: String, document: String) {
        self.title = title
        self.video = URL(string: video)!
        self.document = PDFDocument(url: URL(fileURLWithPath: Bundle.main.path(forResource: document, ofType: "pdf")!))!
    }
}
