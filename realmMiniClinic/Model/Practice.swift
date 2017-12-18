//
//  Practice.swift
//  realmMiniClinic
//
//  Created by Akash Kundu on 12/17/17.
//  Copyright © 2017 Akash Kundu. All rights reserved.
//

import Foundation
import Realm
import RealmSwift


class Practice : Object {
    @objc dynamic var name = ""
    let practitioners = List<Practitioner>()
    let patients = List<Patient>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
