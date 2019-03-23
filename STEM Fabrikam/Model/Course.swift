//
//  Course.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit
//import PDFKit

//struct Course: Codable {
//    var id: String
//    var playlist: URL
//    var title: String
//    var image: UIImage
//    var lessons: [Lesson]
//
//    init(id: String, title: String, image: String, playlist: String, lessons: [Lesson]) {
//        self.id = id
//        self.title = title
//        self.image = UIImage(named: image)!
//        self.lessons = lessons
//        self.playlist = URL(string: "https://www.youtube.com/playlist?list=\(playlist)")!
//    }
//}
//
//struct Lesson: Codable {
//    var video: URL
//    var title: String
//    var document: String
//
//    init(title: String, video: String, document: String) {
//        self.title = title
//        self.video = URL(string: "https://www.youtube.com/watch?v=\(video)")!
//        self.document = PDFDocument(url: URL(fileURLWithPath: Bundle.main.path(forResource: document, ofType: "pdf")!))!
//    }
//}


struct Course: Codable {
    var id: String
    var title: String
    var image: String
    var playlist: String
    var lessons: [Lesson]
    
    init(id: String, title: String, image: String, playlist: String, lessons: [Lesson]) {
        self.id = id
        self.title = title
        self.image = image
        self.lessons = lessons
        self.playlist = "https://www.youtube.com/playlist?list=\(playlist)"
    }
}

struct Lesson: Codable {
    var video: String
    var title: String
    var document: String
    
    init(title: String, video: String, document: String) {
        self.title = title
        self.video = "https://www.youtube.com/watch?v=\(video)"
        self.document = Bundle.main.path(forResource: document, ofType: "pdf")!
    }
}
