//
//  ProfileVC+Views.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class ProfileViews: View {
    lazy var profileContainer = UIView()
    lazy var profileImage = UIImageView(image: UIImage(named: "profile-placeholder"))
    lazy var personalInformationButton = createButtons(for: "Kişisel Bilgilerim")
    lazy var aboutUsButton = createButtons(for: "STEM Fabrikası Hakkında")
    lazy var likeAppButton = createButtons(for: "Uygulamamızı Beğenin")
    lazy var logoutButton = createButtons(for: "Çıkış Yap")
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "STEM Fabrikası"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    override func layoutViews() {
        super.layoutViews()
        
        addSubview(profileContainer)
        profileContainer.layout {
            $0.top == safeTopAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.height == UIScreen.main.bounds.height * 0.3
        }
        
        profileContainer.addSubview(profileImage)
        profileImage.layout {
            $0.centerX == centerXAnchor
            $0.width == (UIScreen.main.bounds.height * 0.3) * 0.5
            $0.height == (UIScreen.main.bounds.height * 0.3) * 0.5
            $0.top == profileContainer.topAnchor + (UIScreen.main.bounds.height * 0.3) * 0.1
        }
        
        profileContainer.addSubview(usernameLabel)
        usernameLabel.layout {
            $0.centerX == centerXAnchor
            $0.top == profileImage.bottomAnchor + (UIScreen.main.bounds.height * 0.3) * 0.1
        }
        
        addSubview(personalInformationButton)
        personalInformationButton.layout {
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == profileContainer.bottomAnchor
            $0.height == (UIScreen.main.bounds.height * 0.7) * 0.125
        }
        
        addSubview(aboutUsButton)
        aboutUsButton.layout {
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == personalInformationButton.bottomAnchor
            $0.height == (UIScreen.main.bounds.height * 0.7) * 0.125
        }
        
        addSubview(likeAppButton)
        likeAppButton.layout {
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == aboutUsButton.bottomAnchor
            $0.height == (UIScreen.main.bounds.height * 0.7) * 0.125
        }
        
        addSubview(logoutButton)
        logoutButton.layout {
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == likeAppButton.bottomAnchor
            $0.height == (UIScreen.main.bounds.height * 0.7) * 0.125
        }
    }
    
}

private extension ProfileViews {
    private func createButtons(for text: String) -> UIButton {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.setTitle(text, for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width * 0.075, bottom: 0, right: 0)
        return button
    }
}
