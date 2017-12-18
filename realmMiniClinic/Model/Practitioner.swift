//
//  Practitioner.swift
//  realmMiniClinic
//
//  Created by Akash Kundu on 12/17/17.
//  Copyright © 2017 Akash Kundu. All rights reserved.
//

import Foundation
import Realm
import RealmSwift


final class Practitioner : Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var gender = ""
    @objc dynamic var practice : String = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
}

