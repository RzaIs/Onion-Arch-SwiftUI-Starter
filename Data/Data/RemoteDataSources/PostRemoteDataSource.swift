//
//  PostRemoteDataSource.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import Foundation

class PostRemoteDataSource:  PostRemoteDataSourceProtocol {
    
    let networkProvider: NetworkProviderProtocol
    
    init(networkProvider: NetworkProviderProtocol) {
        self.networkProvider = networkProvider
    }
    
    var getPosts: [PostRemoteDTO]  {
        get async throws {
            try await self.networkProvider.request(endpoint: PostAPI.get_posts.rawValue)
        }
    }
}
