//
//  Item.swift
//  Todoey
//
//  Created by Marius Gabriel on 21.03.18.
//  Copyright © 2018 Marius Gabriel. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var date: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
