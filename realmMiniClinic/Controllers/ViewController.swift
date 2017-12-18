import UIKit
import RealmSwift

/*
 
 -no inheritance --DONE--
 -follow format of rest of code --DONE--
    -inline
    -camel case
-keep models seperated by class --DONE--
 
 -in temp scene instead of launchscreen
    -init the user configs if sync user is not nil, (checking if sync users is cached)
 -shared realm is created already, once you put in something everyone can read/write
 
 */


//after logging in, url->to find server
//user name and pass -> syncred object

class ViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let serverURL = URL(string: "http://localhost:9080/")!
        let usernameCredentials = SyncCredentials.usernamePassword(username: "bob", password: "bob")
        SyncUser.logIn(with: usernameCredentials,
                       server: serverURL) { user, error in
                        if let user = user {
                            
                            // Create the configuration
                            let syncServerURL = URL(string: "realm://localhost:9080/clinic")!
                            let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: syncServerURL))
                            
                            // Open the remote Realm
                            let realm = try! Realm(configuration: config)
                            print("success")
                            // can now open a synchronized Realm with this user
                        } else if let error = error {
                            print(error)
                        }
        }
        
        
    }
    
}

