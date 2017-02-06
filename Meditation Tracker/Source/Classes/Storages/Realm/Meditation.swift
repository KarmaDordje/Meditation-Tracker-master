//
//  Meditation.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 06.01.17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//
//  MeditationStorageModel

import Foundation
import RealmSwift

class Meditation: Object {

// Specify properties to ignore (Realm won't persist these)
    dynamic var name = ""
    dynamic var count = 0
    dynamic var targetAmount = 0
    dynamic var malasStep = 108
    dynamic var id = 0
    dynamic var imageName = ""
    dynamic var date = NSDate()

    override class func primaryKey() -> String? {
        return "id"
    }

//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
