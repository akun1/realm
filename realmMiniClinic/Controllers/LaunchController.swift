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

class LaunchController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let serverURL = URL(string: "http://localhost:9080/")!
        let syncServerURL = URL(string: "realm://localhost:9080/test")!
     
        //does NOT check if user cached for testing
        //should fail to find and go automatically to login screen
        
        /*  if let user = SyncUser.current {
            //has cached user, log it in and segue past login screen
            let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: syncServerURL))
            //open realm w config
            realm = try! Realm(configuration: config)
            //have to check if user is patient or doc

            
            
            DispatchQueue.main.async() {
                self.performSegue(withIdentifier: "launchToPatient", sender: self)
            }
            print("user found, success")
            
        }
        else {*/
            
            //user not found, taken to login screen
            DispatchQueue.main.async() {
                self.performSegue(withIdentifier: "toLoginScreen", sender: self)
            }
        //}
    
    }
    
}

