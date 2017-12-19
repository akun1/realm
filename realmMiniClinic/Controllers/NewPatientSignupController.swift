//
//  NewPatientSignupController.swift
//  realmMiniClinic
//
//  Created by Akash Kundu on 12/18/17.
//  Copyright © 2017 Akash Kundu. All rights reserved.
//

import UIKit
import RealmSwift



class NewPatientSignupController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var fillEverythingError: UILabel!
    @IBOutlet var patientAttrs: Array<UITextField> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillEverythingError.isHidden = true
    }
    
    
    @IBAction func newPatientFormComplete(_ sender: Any) {
       
        if (everyFieldFilled()) {
            connectToRealm()
        }
    }
    
    func everyFieldFilled() -> Bool {
        for box in patientAttrs {
            if (box.text?.isEmpty)! {
                fillEverythingError.isHidden = false
                return false
            }
        }
        return true
    }
    
    func connectToRealm()
    {
        let newUserCredentials = SyncCredentials.usernamePassword(username: usernameText.text!,
                                                                  password: passwordText.text!,
                                                                  register: true)
        let serverURL = URL(string: "http://localhost:9080/")!
        
        SyncUser.logIn(with: newUserCredentials,
                       server: serverURL) { user, error in
                        if let user = user {
                            let syncServerURL = URL(string: "realm://localhost:9080/clinic")!
                            let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: syncServerURL))
                            
                            realm = try! Realm(configuration: config)
                            print("user created success")
                            
                            let newPatient = Patient(attrs: self.patientAttrs)
                            
                            try! realm?.write {
                                realm?.add(newPatient)
                            }
                            
                            if (realm?.isEmpty == false) {
                                self.performSegue(withIdentifier: "patientSignupToPatient", sender: self)
                            }
                            
                        } else if error != nil {
                            self.fillEverythingError.isHidden = false
                            return
                        }
        }
    }
}
