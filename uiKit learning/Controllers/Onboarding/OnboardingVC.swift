//
//  OnboardingController.swift
//  uiKit learning
//
//  Created by Trent Bowden on 2/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

import UIKit

enum E_ButtonTags:Int {
    case Signup = 1
    case Login = 2
}

struct OnboardC_Data {
    var title:String
    var description:String
    var imageURL:String
    
    init(inputTitle:String, inputDescription:String, inputImageURL:String) {
        title = inputTitle
        description = inputDescription
        imageURL = inputImageURL
    }
}

class OnboardingController: UIViewController {
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped: " + sender.currentTitle!)
        switch(sender.tag){
        case E_ButtonTags.Signup.rawValue :
                print("Need to launch the get started screen.")
                let loginViewController = LoginController()
                navigationController?.pushViewController(loginViewController, animated: true) 
        case E_ButtonTags.Login.rawValue :
                print("Need to sign in the user.")
            default :
                print("No idea what this button is.")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The data we would like to show:
        var onboardingData: [OnboardC_Data] = []
        
        // The slides and their content:
        onboardingData.append(OnboardC_Data(
            inputTitle: "Point number one",
            inputDescription: "Description",
            inputImageURL: "navigator.png"))
        
        onboardingData.append(OnboardC_Data(
            inputTitle: "Point number 2",
            inputDescription: "Description2",
            inputImageURL: "navigator.png"))
        
        onboardingData.append(OnboardC_Data(
            inputTitle: "Third title",
            inputDescription: "This description is incredibly lengthy and I need to know how it pins to the sides to make some kind of thing. Also, does it take \n newlines?",
            inputImageURL: "navigator.png"))
        
        // Scroll view
        let onboardHero = OnboardingHeroComponent()
        let onboardHeroView: UIView = onboardHero.OnboardingHeroView(pageContents: onboardingData)

        // Get started button
        let getStartedButton = UIButton()
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.setTitle("Get started", for: .normal)
        getStartedButton.backgroundColor = .cyan
        getStartedButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        getStartedButton.tag = E_ButtonTags.Signup.rawValue
        
        // Have an account? sign in button
        let existingUserButton = UIButton()
        existingUserButton.translatesAutoresizingMaskIntoConstraints = false
        existingUserButton.setTitle("Have an account? Sign in here", for: .normal)
        existingUserButton.backgroundColor = .lightGray
        existingUserButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        existingUserButton.tag = E_ButtonTags.Login.rawValue
        
        view.addSubview(existingUserButton)
        existingUserButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        existingUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        existingUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        existingUserButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(getStartedButton)
        getStartedButton.bottomAnchor.constraint(equalTo: existingUserButton.topAnchor).isActive = true
        getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(onboardHeroView)
        onboardHeroView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        onboardHeroView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        onboardHeroView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        onboardHeroView.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor).isActive = true
        
        view.backgroundColor = .green
    }
}

