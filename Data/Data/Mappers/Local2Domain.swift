//
//  Local2Domain.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Domain

extension PostLocalDTO {
    var toDomain: PostEntity {
        PostEntity(
            id: self.id,
            title: self.title,
            body: self.body,
            userId: self.userId
        )
    }
}
