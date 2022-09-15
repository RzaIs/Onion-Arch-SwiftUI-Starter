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

    @ObservedObject private var service: PostService
    private let navProvider: NavProviderProtocol
    
    init(service: PostService, navProvider: NavProviderProtocol) {
        self.service = service
        self.navProvider = navProvider
    }
    
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
        NavProviderMock.instance.postView
    }
}

#endif
