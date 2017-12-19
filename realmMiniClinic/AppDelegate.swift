import UIKit
import RealmSwift

//not sure if this good idea, but now realm var an be accessed from everywhere
//reading this out loud makes it seem like a bad idea, i guess we will see
var realm : Realm? = nil

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
