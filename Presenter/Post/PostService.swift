//
//  PostService.swift
//  Presenter
//
//  Created by Rza Ismayilov on 23.08.22.
//

import Combine
import Domain

class PostService: BaseService<[PostEntity], Void> {
    
    private let syncPostUseCase: BaseAsyncThrowsUseCase<Void>
    private let observePostsUseCase: BaseObserveUseCase<[PostEntity]>
    
    init(
        syncPostUseCase: BaseAsyncThrowsUseCase<Void>,
        observePostsUseCase: BaseObserveUseCase<[PostEntity]>
    ) {
        self.syncPostUseCase = syncPostUseCase
        self.observePostsUseCase = observePostsUseCase
        super.init(state: [], effect: Void())
    }
    
    func syncPosts() async {
        do {
            try await self.syncPostUseCase.execute
        } catch {
            await self.show(error: error)
        }
        
    }
    
    func observePosts() {
        self.observePostsUseCase.observe.assign(to: &self.$state)
    }
}
