//
//  Patient.swift
//  realmMiniClinic
//
//  Created by Akash Kundu on 12/17/17.
//  Copyright © 2017 Akash Kundu. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class Patient : Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var gender = ""
    @objc dynamic var height = 0
    @objc dynamic var weight = 0
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
}
