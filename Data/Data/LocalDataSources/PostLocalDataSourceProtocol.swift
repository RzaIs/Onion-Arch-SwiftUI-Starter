//
//  PostLocalDataSourceProtocol.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import Combine

protocol PostLocalDataSourceProtocol {
    var observe: AnyPublisher<[PostLocalDTO], Never>  { get }
    var read: [PostLocalDTO] { get }
    func write(posts: [PostLocalDTO]) throws
    func delete(filter: @escaping (PostLocalDTO) -> Bool) throws
    func deleteAll() throws
}
