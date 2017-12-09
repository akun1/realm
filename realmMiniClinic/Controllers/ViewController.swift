import UIKit
import RealmSwift

/*
 
 
 
 */


class ViewController: UITableViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
      /*  let serverURL = URL(string: "http://localhost:9080/")!
        let usernameCredentials = SyncCredentials.usernamePassword(username: "", password: "")
        SyncUser.logIn(with: usernameCredentials,
                       server: serverURL) { user, error in
                        if let user = user {
                            
                            print("success")
                            // can now open a synchronized Realm with this user
                        } else if let error = error {
                            print("failed")
                        }
        }
*/
        
        
        // Create the configuration
        let syncServerURL = URL(string: "realm://localhost:9080/~/userRealm")!
        let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: syncServerURL))
        
        // Open the remote Realm
        let realm = try! Realm(configuration: config)
        
        
    }
    
}

