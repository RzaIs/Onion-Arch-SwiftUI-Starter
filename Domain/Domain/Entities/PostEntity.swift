//
//  PostEntity.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Foundation

public struct PostEntity: Identifiable {
    public let id: Int
    public let title: String
    public let body: String
    public let userId: Int
    
    public init(
        id: Int,
        title: String,
        body: String,
        userId: Int
    ) {
        self.id = id
        self.title = title
        self.body = body
        self.userId = userId
    }
}
