//
//  PostRemoteDTO.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

struct PostRemoteDTO: Decodable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}
