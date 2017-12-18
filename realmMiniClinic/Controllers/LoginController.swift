//
//  LoginController.swift
//  realmMiniClinic
//
//  Created by Akash Kundu on 12/18/17.
//  Copyright © 2017 Akash Kundu. All rights reserved.
//

import UIKit
import RealmSwift

class LoginController: UIViewController {

    @IBOutlet weak var userNameTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func credentialsEntered(_ sender: Any) {
        
        let serverURL = URL(string: "http://localhost:9080/")!
        let usernameCredentials = SyncCredentials.usernamePassword(username: userNameTextBox.text!, password: passwordTextBox.text!)
        SyncUser.logIn(with: usernameCredentials,
                       server: serverURL) { user, error in
                        if let user = user {
                            // Create the new configuration
                            //will create a realm belonging to user thats logged in named "test"
                            let syncServerURL = URL(string: "realm://localhost:9080/test")!
                            let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: syncServerURL))
                            
                            // Open the remote Realm
                            let realm = try! Realm(configuration: config)
                            print("success")
                            // can now open a synchronized Realm with this user
                        } else if let error = error {
                            print("failed")
                            print("user: \(user)")
                            
                            print(error)
                        }
        }
        
    }
    // Do any additional setup after loading the view.
}
