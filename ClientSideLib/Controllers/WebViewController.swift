//
//  WebViewController.swift
//
//  Created by Sushkov Anton on 1/24/18.
//  Copyright © 2018 A1QA. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate  {
    
    var url = URL (string: "")
    var config = Config()
    var timeOut: Timer!
    @IBOutlet weak var ResultWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultWebView.navigationDelegate = self;
        ResultWebView.load(URLRequest(url: url!))
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
        self.timeOut.invalidate()
    }
  
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
        self.timeOut = Timer.scheduledTimer(timeInterval:TimeInterval(config.getServerTimeout()), target: self,selector: #selector(cancelWeb), userInfo: nil, repeats: false)
    }
    
    func webView(_ webView: WKWebView, didFailNavigation navigation: WKNavigation) {
        self.timeOut.invalidate()
    }
    
    @objc private func cancelWeb() {
        let alert = UIAlertController(title: "Error", message: "Connection timeout", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
