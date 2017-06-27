//
//  LoginViewController.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/7/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (UserDefaults.standard.string(forKey: "access_token") != nil) {
            self.loginButton.isEnabled = false
        } else {
            self.loginButton.isEnabled = true
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (UserDefaults.standard.string(forKey: "access_token") != nil) {
            self.loginButton.isEnabled = false
        } else {
            self.loginButton.isEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        API.shared.oAuth()
        
    }
    
    func dismissLoginController() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}
