//
//  PostRemoteDTO.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

class PostRemoteDTO: Decodable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
    
    init(id: Int, title: String, body: String, userId: Int) {
        self.id = id
        self.title = title
        self.body = body
        self.userId = userId
    }
}
