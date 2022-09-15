//
//  PostRemoteDataSourceProtocol.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import Foundation

protocol PostRemoteDataSourceProtocol {
    var getPosts: [PostRemoteDTO] { get async throws }
}
