//
//  PostRepo.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import Combine
import Domain

class PostRepo: PostRepoProtocol {    
        
    private let localDataSoruce: PostLocalDataSourceProtocol
    private let remoteDataSource: PostRemoteDataSourceProtocol
    
    init(localDataSoruce: PostLocalDataSourceProtocol,
         remoteDataSource: PostRemoteDataSourceProtocol
    ) {
        
        self.localDataSoruce = localDataSoruce
        self.remoteDataSource = remoteDataSource
    }

    func syncPosts() async throws {
        let posts = try await self.remoteDataSource.getPosts.map { post in
            post.toLocal
        }
        try self.localDataSoruce.write(posts: posts)
    }
    
    var observePosts: AnyPublisher<[PostEntity], Never> {
        self.localDataSoruce.observe.map { localDTOs in
            localDTOs.map { $0.toDomain }
        }.eraseToAnyPublisher()
    }
}
