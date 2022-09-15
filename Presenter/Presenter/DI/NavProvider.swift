//
//  NavProvider.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Domain
import Swinject

public protocol NavProviderProtocol {
    var postView: PostView { get }
}

class NavProvider: NavProviderProtocol {
    
    private let r: Resolver
    
    init(resolver: Resolver) {
        self.r = resolver
    }
    
    var postView: PostView {
        r.resolve(PostView.self)!
    }
}

#if DEBUG

class NavProviderMock: NavProviderProtocol {
    
    static let instance: NavProviderMock = .init()
    
    var postView: PostView {
        PostView(
            service: PostService(
                syncPostUseCase: SyncPostUseCaseMock(),
                observePostsUseCase: ObservePostsUseCaseMock()
            ),
            navProvider: NavProviderMock()
        )
    }
}

#endif
