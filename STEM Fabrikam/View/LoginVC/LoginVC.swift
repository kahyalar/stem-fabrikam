//
//  LoginVC.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class LoginVC: ViewController<LoginViews> {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.rootView = self
        customView.loginButton.addTarget(nil, action: #selector(handleButtonTap), for: .touchUpInside)
        customView.registerButton.addTarget(nil, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    // MARK: This code is created for prototyping purposes.
    // After prototyping phase, secure way will be implemented.
    @objc func handleButtonTap(){
        if customView.emailInput.text == "admin" && customView.passwordInput.text == "123456" {
            DataService.shared.setUserInfo(value: true)
            UIApplication.shared.keyWindow?.rootViewController = appDelegate.initTabBarController()
        } else {
            highlightWrongPassword()
        }
    }
}

private extension LoginVC {
    private func highlightWrongPassword(){
        customView.emailInput.underlined(color: .red)
        customView.passwordInput.underlined(color: .red)
    }
}

