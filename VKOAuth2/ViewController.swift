//
//  LoginViewController.swift
//  VKOAuth2
//
//  Created by Admin on 11.08.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchedLogin(button: UIButton) {
        guard let vkUrl = URL(string: "https://oauth.vk.com/authorize?client_id=7469071&redirect_uri=https://google.com&display=mobile&response_type=token&scope=8194&revoke=1") else { return }
        
        let session = ASWebAuthenticationSession(url: vkUrl, callbackURLScheme: "https://google.com") { (url, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            print("Ok")
        }
        
        session.presentationContextProvider = self
        
        session.start()
        
    }
}

extension LoginViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
    
    
}
