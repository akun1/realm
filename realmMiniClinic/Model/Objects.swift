//
//  HumanObjects.swift
//  realmMiniClinic
//
//  Created by Akash Kundu on 11/17/17.
//  Copyright © 2017 Akash Kundu. All rights reserved.
//

import Foundation
import Realm
import RealmSwift


final class Practitioner: Human
{
    
    @objc dynamic var practice : String = ""
    
}

final class Patient: Human
{
    
    @objc dynamic var height = 0
    @objc dynamic var weight = 0

}

class Human: Object
{
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var gender = ""
    
    override static func primaryKey() -> String?
    {
        return "name"
    }
    
}


class Practice : Object
{
    @objc dynamic var name = ""
    let practitioners = List<Practitioner>()
    let patients = List<Patient>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
