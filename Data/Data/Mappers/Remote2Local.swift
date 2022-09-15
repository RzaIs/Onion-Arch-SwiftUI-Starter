//
//  Remote2Local.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

extension PostRemoteDTO {
    var toLocal: PostLocalDTO {
        PostLocalDTO(
            id: self.id,
            title: self.title,
            body: self.body,
            userId: self.userId
        )
    }
}
