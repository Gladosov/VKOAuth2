//
//  LoginViewController.swift
//  VKOAuth2
//
//  Created by Admin on 11.08.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import UIKit
import SafariServices

//class LoginViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//    }
//
//    @IBAction func touchedLogin(button: UIButton) {
//        guard let vkUrl = URL(string: "https://oauth.vk.com/authorize?client_id=7469071&redirect_uri=https://google.com&display=mobile&response_type=token&scope=8194&revoke=1") else { return }
//        guard let redirectURL = URL(string: "https://www.google.com") else {
//            return
//        }
//
//        let authController = WebViewController()
//        authController.initURL = vkUrl
//        authController.redirectURL = redirectURL
//        authController.completion = { result in
//            switch result {
//            case .success(let response):
//                UserDefaults.standard.set(response.accessToken, forKey: "token")
//                UserDefaults.standard.set(response.userID, forKey: "userID")
//                UserDefaults.standard.set(response.expiresDate, forKey: "expiresDate")
//
//            case .failure(_):
//                print("Error")
//            }
//        }
//        present(authController, animated: true)
//    }
//}
