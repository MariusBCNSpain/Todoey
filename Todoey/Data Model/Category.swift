//
//  Category.swift
//  Todoey
//
//  Created by Marius Gabriel on 21.03.18.
//  Copyright © 2018 Marius Gabriel. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    var items = List<Item>()
}

