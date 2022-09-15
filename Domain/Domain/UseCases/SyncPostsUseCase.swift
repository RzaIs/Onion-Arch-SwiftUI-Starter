//
//  SyncPostsUseCase.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import Foundation

public class SyncPostsUseCase: BaseAsyncThrowsUseCase<Void> {
    private let repo: PostRepoProtocol
    
    init(repo: PostRepoProtocol) {
        self.repo = repo
    }
    
    public override var execute: Void {
        get async throws {
            try await self.repo.syncPosts()
        }
    }
}

#if DEBUG

public class SyncPostUseCaseMock: BaseAsyncThrowsUseCase<Void> {
    public override init() { }
    public override var execute: Void {
        get async throws { }
    }
}

#endif
