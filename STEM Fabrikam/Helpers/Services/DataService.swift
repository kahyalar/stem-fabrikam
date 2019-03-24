//
//  DataService.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class DataService {
    private init(){}
    static let shared = DataService()
    private let defaults = UserDefaults.standard
    
    func isUserExists() -> Bool {
        return defaults.bool(forKey: "isUserExists")
    }
    
    func setUserInfo(value: Bool) {
        defaults.set(value, forKey: "isUserExists")
    }
    
    func getCourses() -> [Course] {
        guard let data = defaults.object(forKey: "courses") else {
            return []
        }
        let courses = try! JSONDecoder().decode([Course].self, from: data as! Data)
        return courses
    }
    
    func saveCourse(course: Course) {
        var courses = getCourses()
        if courses.isEmpty {
            courses.append(course)
        }
        else {
            for c in courses {
                if c.id != course.id {
                    courses.append(course)
                }
            }
        }
        let data = try! JSONEncoder().encode(courses)
        defaults.set(data, forKey: "courses")
    }
    
    func getCourseIds() -> [String] {
        guard let array = defaults.stringArray(forKey: "courseId") else {
            return []
        }
        return array
    }
    
    func saveCourseId(id: String) {
        var ids = getCourseIds()
        if ids.isEmpty {
            ids.append(id)
        } else {
            for i in ids {
                if i != id {
                    ids.append(id)
                }
            }
        }
        defaults.set(ids, forKey: "courseId")
    }
    
    func getEnrolledCourses() -> [Course] {
        var enrolled: [Course] = []
        let ids = getCourseIds()
        let courses = getCourses()
        for course in courses {
            for id in ids {
                if course.id == id {
                    enrolled.append(course)
                }
            }
        }
        return enrolled
    }
    
}
