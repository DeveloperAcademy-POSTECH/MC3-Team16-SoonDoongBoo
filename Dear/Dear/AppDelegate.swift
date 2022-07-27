//
//  AppDelegate.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/14.
//

import UIKit
import FirebaseCore
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        sleep(1)
        
        FirebaseApp.configure()
        Auth.auth().signInAnonymously { authResult, error in
            guard let user = authResult?.user else { return }
            let uid = user.uid
            print(uid)
        }
        return true
    }
    
<<<<<<< Updated upstream
=======
    // MARK: UISceneSession Lifecycle
    
>>>>>>> Stashed changes
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    
}

