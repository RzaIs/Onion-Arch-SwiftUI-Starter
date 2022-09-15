//
//  NavProvider.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Foundation
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
        PostView(service: r.resolve(PostService.self)!)
    }
}


