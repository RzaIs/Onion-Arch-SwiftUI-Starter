//
//  DomainDI.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Foundation
import Swinject

public class DomainAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        container.register(SyncPostsUseCase.self) { r in
            SyncPostsUseCase(repo: r.resolve(PostRepoProtocol.self)!)
        }
        
        container.register(ObservePostsUseCase.self) { r in
            ObservePostsUseCase(repo: r.resolve(PostRepoProtocol.self)!)
        }
    }
}
