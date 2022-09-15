//
//  DatabaseProvider.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import RealmSwift

class DatabaseProvider: DatabaseProviderProtocol {
    
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func get<T: Object>() -> [T]  {
        self.main {
            self.realm.objects(T.self).freeze().map { $0 }
        }
    }
    
    func write<T: Object>(objects: [T]) throws {
        try self.main {
            try self.realm.write {
                self.realm.add(objects, update: .modified)
            }
        }
    }
    
    func deleteAll<T: Object>(of: T.Type) throws {
        try self.main {
            let objects = self.realm.objects(T.self)
            try self.realm.write {
                self.realm.delete(objects)
            }
        }
    }
    
    func delete<T: Object>(of: T.Type, filter: @escaping (T) -> Bool) throws {
        try self.main {
            let objects = self.realm.objects(T.self).filter(filter)
            try self.realm.write {
                self.realm.delete(objects)
            }
        }
    }
    
    func deleteAll() throws {
        try self.main {
            try self.realm.write {
                self.realm.deleteAll()
            }
        }
    }
    
    func main<T>(task: @escaping () throws -> T ) throws -> T {
        if !Thread.isMainThread {
            return try DispatchQueue.main.sync {
                return try task()
            }
        } else {
            return try task()
        }
    }
    
    func main<T>(task: @escaping () -> T ) -> T {
        if !Thread.isMainThread {
            return DispatchQueue.main.sync {
                return task()
            }
        } else {
            return task()
        }
    }
}
