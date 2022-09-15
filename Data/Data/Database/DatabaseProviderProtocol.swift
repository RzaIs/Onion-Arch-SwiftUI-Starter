//
//  DatabaseProviderProtocol.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import RealmSwift

protocol DatabaseProviderProtocol {
    func get<T: Object>() -> [T]
    func write<T: Object>(objects: [T]) throws
    func deleteAll<T: Object>(of: T.Type) throws
    func delete<T: Object>(of: T.Type, filter: @escaping (T) -> Bool) throws
    func deleteAll() throws
}

