//
//  ViewController.swift
//  WebNavigation
//
//  Created by Matheus Lenke on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var webview: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
        web.navigationDelegate = self
        web.translatesAutoresizingMaskIntoConstraints = false
        return web
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Web Navigation"
        
        view.backgroundColor = .systemBackground
        configureUI()
        setupWebView()
    }
    
    private func setupWebView() {
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        webview.load(request)
    }

    private func configureUI() {
        view.addSubview(webview)
        
        NSLayoutConstraint.activate([
            webview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            webview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1.00)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .black
        let forwardBarItem = UIBarButtonItem(image: UIImage.init(systemName: "chevron.right.square.fill"), style: .plain, target: self, action: #selector(forwardAction))
        
        let backBarItem = UIBarButtonItem(image: UIImage.init(systemName: "chevron.backward.square.fill"), style: .plain, target: self, action: #selector(backAction))
        
        let reloadBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.uturn.left.circle.fill"), style: .plain, target: self, action: #selector(reloadWebView))
        
        navigationItem.leftBarButtonItem = reloadBarItem
        navigationItem.rightBarButtonItems = [forwardBarItem, backBarItem]

    }

}

extension ViewController {
    
    @objc
    private func forwardAction() {
        if webview.canGoForward {
            webview.goForward()
        }
    }
    
    @objc
    private func backAction() {
        if webview.canGoBack {
            webview.goBack()
        }
    }
    
    @objc
    private func reloadWebView() {
        webview.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Iniciando")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Terminou")
    }
}

