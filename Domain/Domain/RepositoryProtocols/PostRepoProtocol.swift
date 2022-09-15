//
//  PostRepoProtocol.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Combine

public protocol PostRepoProtocol {
    func syncPosts() async throws
    var observePosts: AnyPublisher<[PostEntity], Never> { get }
}

