//
//  AppDelegate.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 20.12.16.
//  Copyright © 2016 MACBOOK. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

// remove try! and assign function do-catch
//let realm = try! Realm()

let realm = addRealm()

func addRealm() -> Realm {
    do {
        let realm = try Realm()
        return realm
    } catch {
        return realm
    }
    
}

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        return true
    }
}
