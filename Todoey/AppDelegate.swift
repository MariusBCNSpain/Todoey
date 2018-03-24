//
//  AppDelegate.swift
//  Todoey
//
//  Created by Marius Gabriel on 07.03.18.
//  Copyright © 2018 Marius Gabriel. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
       
        
        do{
        _ = try Realm()
            
        }catch {
            print("Error initialising new Relm, \(error)")
        }
            
            
        // Override point for customization after application launch.
        return true
    }
    
 
}

