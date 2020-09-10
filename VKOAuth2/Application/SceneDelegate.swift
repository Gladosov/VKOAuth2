//
//  SceneDelegate.swift
//  VKOAuth2
//
//  Created by Admin on 11.08.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.isHidden = true
        rootViewController.setRootWireframe(LoginWireframe())
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

