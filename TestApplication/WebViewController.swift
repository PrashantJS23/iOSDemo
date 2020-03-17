//
//  WebViewController.swift
//  TestApplication
//
//  Created by WYH_MAC001 on 17/03/20.
//  Copyright © 2020 prashant. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setNeedsLayout()
        self.webView.navigationDelegate = self
        let token = PreferenceManager.shared.readString(key: PreferenceManager.KEY_LOGIN_TOKEN)
        print("https://www.mckinleyrice.com/?token=\(token)")
        let request = URLRequest(url: URL.init(string: "https://www.mckinleyrice.com/?token=\(token)")!)
        self.webView.load(request)
    }
}
extension WebViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("stop")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        print("Failed to load")
    }
}
