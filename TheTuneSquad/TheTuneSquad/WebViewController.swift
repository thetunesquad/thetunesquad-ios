//
//  WebViewController.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/27/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    let webView = WKWebView()
    
    var url : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: self.url) else { return }
        
        webView.frame = self.view.frame
        self.view.addSubview(self.webView)
        
        let urlRequest = URLRequest(url: url)
        
        self.webView.load(urlRequest)
    }
}
