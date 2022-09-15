//
//  PresenterDI.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Domain
import Swinject

public class PresenterAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        
        container.register(NavProviderProtocol.self) { r in
            NavProvider(resolver: r)
        }
        
        container.register(PostService.self) { r in
            PostService(
                syncPostUseCase: r.resolve(SyncPostsUseCase.self)!,
                observePostsUseCase: r.resolve(ObservePostsUseCase.self)!
            )
        }
    }
}
