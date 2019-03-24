//
//  LessonCell.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class LessonCell: Cell {
    var lesson: Lesson!
    weak var rootView: UIViewController!
    lazy var title: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override func initializeViews() {
        super.initializeViews()
        backgroundColor = .lightRed
        
        addSubview(title)
        title.layout {
            $0.centerX == centerXAnchor
            $0.centerY == centerYAnchor
            $0.width == UIScreen.main.bounds.width * 0.9
        }
    }
    
    func setCell(for lesson: Lesson, with position: Int){
        title.text = "\(position + 1)-) \(lesson.title)"
    }
    
    func goToLesson(){
        let lessonVC = LessonDetailsVC()
        lessonVC.lesson = lesson
        rootView.navigationController?.pushViewController(lessonVC, animated: true)
    }
}
