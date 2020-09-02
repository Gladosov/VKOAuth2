//
//  LoginWireframe.swift
//  VKOAuth2
//
//  Created by Admin on 02.09.2020.
//  Copyright (c) 2020 Danil Semenov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit


final class LoginWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Login", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: LoginViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {
    func navigate(to option: LoginNavigationOption) {
        switch option {
        case .home:
            break
        case .web:
            let wireframe = WebWireframe()
            
            navigationController?.present(wireframe.viewController, animated: true)
        }
    }
    
}