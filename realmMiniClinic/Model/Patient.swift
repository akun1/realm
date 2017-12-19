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
    @objc dynamic var gender = ""
    @objc dynamic var height = ""
    @objc dynamic var weight = ""
    
    convenience init(attrs: [UITextField]) {
        self.init()
        name = attrs[0].text! + " " + attrs[1].text!
        gender = attrs[2].text!
        height = attrs[3].text!
        weight = attrs[4].text!
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
}
