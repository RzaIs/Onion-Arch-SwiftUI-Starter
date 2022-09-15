//
//  PostLocalDataSource.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Combine

class PostLocalDataSource: PostLocalDataSourceProtocol {
    
    private let databaseProvider: DatabaseProviderProtocol
    private let postSubject: CurrentValueSubject<[PostLocalDTO], Never> = .init([])
    
    init(databaseProvider: DatabaseProviderProtocol) {
        self.databaseProvider = databaseProvider
        self.postSubject.send(databaseProvider.get())
    }
    
    var observe: AnyPublisher<[PostLocalDTO], Never> {
        self.postSubject.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    var read: [PostLocalDTO] {
        self.databaseProvider.get()
    }
    
    func write(posts: [PostLocalDTO]) throws {
        try self.databaseProvider.deleteAll(of: PostLocalDTO.self)
        try self.databaseProvider.write(objects: posts)
        self.postSubject.send(posts)
    }
    
    func delete(filter: @escaping (PostLocalDTO) -> Bool) throws {
        try self.databaseProvider.delete(of: PostLocalDTO.self, filter: filter)
    }
    
    func deleteAll() throws {
        try self.databaseProvider.deleteAll(of: PostLocalDTO.self)
    }
}
