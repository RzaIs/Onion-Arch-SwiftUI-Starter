//
//  PostView.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 22.08.22.
//

import SwiftUI
import Combine
import Domain

public struct PostView: View {

    @ObservedObject var service: PostService
    
    public var body: some View {
        NavigationView {
            List(self.service.state) { post in
                NavigationLink {
                    PostDetails(details: post)
                } label: {
                    VStack {
                        HStack {
                            Text(post.title)
                                .font(.headline)
                            Spacer()
                        }.padding(.bottom, 2)
                        HStack {
                            Text(post.body)
                                .font(.body)
                            Spacer()
                        }
                    }.padding()
                }
            }.refreshable {
                Task {
                    await self.service.syncPosts()
                }
            }.alert("An Error Occured", isPresented: self.$service.hasError) {
                VStack {
                    Button {
                        Task {
                            await self.service.syncPosts()
                        }
                    } label: {
                        Text("Retry")
                    }
                    Button {} label: {
                        Text("OK")
                    }
                }
            } message: {
                Text(self.service.error.localizedDescription)
            }.navigationTitle("Posts")
        }.onAppear {
            self.service.observePosts()
            Task {
                await self.service.syncPosts()
            }
        }.onDisappear {
            
        }
    }
}

#if DEBUG

struct PostView_Previews: PreviewProvider {

    static var previews: some View {
        PostView(
            service: PostService(
                syncPostUseCase: SyncPostUseCaseMock(),
                observePostsUseCase: ObservePostsUseCaseMock()
            )
        )
    }
}

class SyncPostUseCaseMock: BaseAsyncThrowsUseCase<Void> {
    
    override init() { }
    
    override var execute: Void {
        get async throws {
            print("SYNC")
        }
    }
}

class ObservePostsUseCaseMock: BaseObserveUseCase<[PostEntity]> {
    
    override init() { }
    
    override var observe: AnyPublisher<[PostEntity], Never> {
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
