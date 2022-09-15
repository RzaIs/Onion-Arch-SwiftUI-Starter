//
//  PostLocalDTO.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import Foundation
import RealmSwift
import Realm

class PostLocalDTO: Object {
    @Persisted(primaryKey: true) var id: Int = UUID().hashValue
    @Persisted var title: String = ""
    @Persisted var body: String = ""
    @Persisted var userId: Int = 0
    
    convenience init(id: Int, title: String, body: String, userId: Int) {
        self.init()
        self.id = id
        self.title = title
        self.body = body
        self.userId = userId
    }
}
