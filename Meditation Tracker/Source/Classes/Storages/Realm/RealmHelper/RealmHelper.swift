//
//  RealmHelper.swift
//  
//
//  Created by MACBOOK on 06.02.17.
//
//

import Foundation
import RealmSwift

class RealmHelper {
    static func addRealm() {
        do {
            let realm = try Realm ()
        } catch let error as NSError {
            print(error)
        }
    }
}
