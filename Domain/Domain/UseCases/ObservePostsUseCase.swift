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
