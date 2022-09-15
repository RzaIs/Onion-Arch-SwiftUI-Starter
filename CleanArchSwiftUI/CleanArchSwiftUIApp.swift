//
//  CleanArchSwiftUIApp.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import SwiftUI
import Domain
import Presenter
import Data
import Swinject

@main
struct CleanArchSwiftUIApp: App {
    
    public static let appAssembler: Assembler = .init([
        PresenterAssembly(),
        DomainAssembly(),
        DataAssembly(baseURL: "https://jsonplaceholder.typicode.com")
    ])
    
    var body: some Scene {
        WindowGroup {
            CleanArchSwiftUIApp.appAssembler.resolver
                .resolve(NavProviderProtocol.self)!
                .postView
        }
    }
}
