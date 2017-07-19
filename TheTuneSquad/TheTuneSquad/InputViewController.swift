//
//  InputViewController.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/7/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

//    @IBOutlet weak var artist1TextField: UITextField!
//    
//    @IBOutlet weak var artist2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        print("inside function update")
        print(UserDefaults.standard.value(forKey: "access_token") as Any)
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "access_token")
        if (UserDefaults.standard.string(forKey: "access_token") != nil) {
            print(UserDefaults.standard.value(forKey: "access_token") as Any)
        } else {
            print("no token saved in user defaults, logout worked")
        }
    }
}
