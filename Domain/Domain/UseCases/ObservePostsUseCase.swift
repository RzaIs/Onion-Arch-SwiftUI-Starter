//
//  ObservePostsUseCase.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Combine

public class ObservePostsUseCase: BaseObserveUseCase<[PostEntity]> {
    private let repo: PostRepoProtocol
    
    public init(repo: PostRepoProtocol) {
        self.repo = repo
    }
    
    public override var observe: AnyPublisher<[PostEntity], Never> {
        self.repo.observePosts
    }
}

#if DEBUG


public class ObservePostsUseCaseMock: BaseObserveUseCase<[PostEntity]> {
    public override init() { }
    public override var observe: AnyPublisher<[PostEntity], Never> {
        CurrentValueSubject<[PostEntity], Never>([
            PostEntity(id: 1, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 2, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 3, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 4, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 5, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 6, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 7, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 8, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 9, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 11, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 12, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 13, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 14, title: "aksjfka", body: "aksdjfkas", userId: 12),
            PostEntity(id: 15, title: "aksjfka", body: "aksdjfkas", userId: 12)
        ]).eraseToAnyPublisher()
    }
}


#endif
