//
//  LoginVC+Views.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class LoginViews: View {
    weak var rootView: LoginVC!
    lazy var logoImage = UIImageView(image: UIImage(named: "logo"))
    lazy var emailInput = createInputFields(with: "Email adresinizi giriniz..", secure: false)
    lazy var passwordInput = createInputFields(with: "Şifrenizi giriniz..", secure: true)
    lazy var loginButton = createButtons(with: "GİRİŞ YAP")
    lazy var registerButton = createButtons(with: "KAYIT OL")
    
    override func layoutViews() {
        super.layoutViews()
        
        addSubview(logoImage)
        logoImage.contentMode = .scaleAspectFit
        logoImage.layout {
            $0.centerX == centerXAnchor
            $0.width == UIScreen.main.bounds.height * 0.3
            $0.height == UIScreen.main.bounds.height * 0.3
            $0.top == topAnchor + UIScreen.main.bounds.height * 0.1
        }
        
        addSubview(emailInput)
        emailInput.layout {
            $0.centerX == centerXAnchor
            $0.width ==  UIScreen.main.bounds.width * 0.7
            $0.height == UIScreen.main.bounds.height * 0.05
            $0.top == logoImage.bottomAnchor + UIScreen.main.bounds.height * 0.025
        }
        
        addSubview(passwordInput)
        passwordInput.layout {
            $0.centerX == centerXAnchor
            $0.width ==  UIScreen.main.bounds.width * 0.7
            $0.height == UIScreen.main.bounds.height * 0.05
            $0.top == emailInput.bottomAnchor + UIScreen.main.bounds.height * 0.015
        }
        
        addSubview(loginButton)
        loginButton.layout {
            $0.centerX == centerXAnchor
            $0.width ==  UIScreen.main.bounds.width * 0.6
            $0.height == UIScreen.main.bounds.height * 0.075
            $0.top == passwordInput.bottomAnchor + UIScreen.main.bounds.height * 0.075
        }
        
        addSubview(registerButton)
        registerButton.layout {
            $0.centerX == centerXAnchor
            $0.width ==  UIScreen.main.bounds.width * 0.6
            $0.height == UIScreen.main.bounds.height * 0.075
            $0.top == loginButton.bottomAnchor + UIScreen.main.bounds.height * 0.02
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        emailInput.underlined()
        passwordInput.underlined()
        loginButton.layer.applyShadow()
        registerButton.layer.applyShadow()
        loginButton.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 10
    }
}

extension LoginViews: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        rootView.view.endEditing(true)
        return false
    }
}

private extension LoginViews {
    private func createInputFields(with text: String, secure: Bool) -> UITextField {
        let input = UITextField()
        input.delegate = self
        input.textColor = .black
        input.placeholder = text
        input.textAlignment = .center
        input.autocorrectionType = .no
        input.isSecureTextEntry = secure
        input.keyboardType = .emailAddress
        input.autocapitalizationType = .none
        return input
    }
    
    private func createButtons(with text: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .lightRed
        button.titleLabel?.textColor = .white
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }
}
