//
//  DI.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Foundation
import RealmSwift
import Swinject
import Domain

public class DataAssembly: Assembly {
    
    private let baseURL: String
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    public func assemble(container: Container) {
        container.register(NetworkProviderProtocol.self) { _ in
            NetworkProvider(baseURL: self.baseURL)
        }
        
        container.register(DatabaseProviderProtocol.self) { _ in
            let realm = try! Realm(
                configuration: Realm.Configuration(
                    schemaVersion: 1,
                    deleteRealmIfMigrationNeeded: true
                )
            )
            return DatabaseProvider(realm: realm)
        }.inObjectScope(.container)
        
        container.register(PostRemoteDataSourceProtocol.self) { r in
            PostRemoteDataSource(networkProvider: r.resolve(NetworkProviderProtocol.self)!)
        }
        
        container.register(PostLocalDataSourceProtocol.self) { r in
            PostLocalDataSource(databaseProvider: r.resolve(DatabaseProviderProtocol.self)!)
        }.inObjectScope(.container)
        
        container.register(PostRepoProtocol.self) { r in
            PostRepo(
                localDataSoruce: r.resolve(PostLocalDataSourceProtocol.self)!,
                remoteDataSource: r.resolve(PostRemoteDataSourceProtocol.self)!
            )
        }.inObjectScope(.container)
    }
}
