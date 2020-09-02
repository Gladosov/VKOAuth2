//
//  WebViewController.swift
//  VKOAuth2
//
//  Created by Admin on 12.08.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import UIKit
import WebKit

//class WebViewController: UIViewController {
//    typealias VKAuthResponse = (accessToken: String, expiresDate: Date, userID: Int)
//
//    lazy var webView: WKWebView = {
//        let webView = WKWebView(frame: .zero)
//        webView.translatesAutoresizingMaskIntoConstraints = true
//        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        webView.allowsBackForwardNavigationGestures = false
//        return webView
//    }()
//
//    lazy var loadIndicator: UIActivityIndicatorView = {
//        let viewIndicator = UIActivityIndicatorView(style: .large)
//        viewIndicator.translatesAutoresizingMaskIntoConstraints = false
//        viewIndicator.startAnimating()
//        viewIndicator.hidesWhenStopped = true
//        return viewIndicator
//    }()
//
//    var initURL: URL!
//    var redirectURL: URL!
//    var completion: (_ accessToken: Result<VKAuthResponse, Error>) -> Void = { _ in }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        setupLayout()
//
//        view.backgroundColor = .systemBackground
//
//        webView.navigationDelegate = self
//        let request = URLRequest(url: initURL)
//        webView.load(request)
//    }
//
//    func setupViews() {
//        view.addSubview(webView)
//        view.addSubview(loadIndicator)
//    }
//
//    func setupLayout() {
//        webView.frame = view.bounds
//
//        NSLayoutConstraint.activate([
//            loadIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            loadIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
//    }
//}
//
//extension WebViewController: WKNavigationDelegate {
//
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//        loadIndicator.startAnimating()
//        webView.isHidden = true
//    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        loadIndicator.stopAnimating()
//        webView.isHidden = false
//
//        guard let url = webView.url else { return }
//        guard var components = URLComponents(string: url.absoluteString) else { return }
//        let host = (components.host)!
//
//        guard let redirectedUrl = URL(string: "https://\(host)") else { return }
//
//        if redirectedUrl == redirectURL {
//            let urlString = url.absoluteString.replacingOccurrences(of: "#", with: "?")
//            components = URLComponents(string: urlString)!
//            guard let queryItems = components.queryItems else {
//                return
//            }
//            guard let token = queryItems.filter({
//                $0.name == "access_token"
//            }).first?.value else {
//                return
//            }
//            guard let dateString = queryItems.filter({
//                $0.name == "expires_in"
//            }).first?.value else {
//                return
//            }
//            guard let userIDItem = queryItems.filter({
//                $0.name == "user_id"
//            }).first?.value,
//                let userID = Int(userIDItem)  else {
//                return
//            }
//
//            let date = Date(timeIntervalSinceNow: Double(dateString)!)
//
//            let response = (token, date, userID)
//            completion(.success(response))
//
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
//}
