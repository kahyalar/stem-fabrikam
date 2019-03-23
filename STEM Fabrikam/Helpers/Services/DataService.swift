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
}
