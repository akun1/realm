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
    @IBOutlet weak var badCredentialsError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.badCredentialsError.isHidden = true
        
    }

    @IBAction func credentialsEntered(_ sender: Any) {
        
        let serverURL = URL(string: "http://localhost:9080/")!
        let usernameCredentials = SyncCredentials.usernamePassword(username: userNameTextBox.text!, password: passwordTextBox.text!)
        SyncUser.logIn(with: usernameCredentials,
                       server: serverURL) { user, error in
                        if let user = user {
                            // Create the new configuration
                            //will create a realm belonging to user thats logged in named "clinic" if "clinic" does not exist
                            let syncServerURL = URL(string: "realm://localhost:9080/clinic")!
                            let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: syncServerURL))
                            
                            // Open the remote Realm
                            realm = try! Realm(configuration: config)
                            print("success")
                            
                            //here is where you segue to either doc or patient info after detecting
                            //which one the logged in user is
                            
                        } else if let error = error {
                            self.badCredentialsError.isHidden = false
                        }
        }
        
    }
    
    
    
}
