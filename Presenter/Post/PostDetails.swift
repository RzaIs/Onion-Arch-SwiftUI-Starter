//
//  PostDetails.swift
//  Presenter
//
//  Created by Rza Ismayilov on 15.09.22.
//

import SwiftUI
import Domain

struct PostDetails: View {
    
    let details: PostEntity
    
    var body: some View {
        VStack  {
            Text("Title: \(details.title)")
                .font(.headline)
                .padding(.bottom)
            Text("Body: \(details.body)")
                .font(.body)
                .padding(.bottom)
            Text("post id: \(details.id)")
                .padding(.bottom)
            Text("author id: \(details.userId)")
                .padding(.bottom)
        }    }
}

#if DEBUG

struct PostDetails_Previews: PreviewProvider {
    static var previews: some View {
        PostDetails(
            details: PostEntity(
                id: 2131234,
                title: "ADSJKALSD",
                body: "asjdhsjkdhfskjdfhakjfhskjdfjdsf",
                userId: 132
            )
        ).frame(height: 200)
    }
}

#endif
