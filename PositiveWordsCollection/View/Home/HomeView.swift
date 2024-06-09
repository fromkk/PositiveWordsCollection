//
//  HomeView.swift
//  PositiveWordsCollection
//
//  Created by Hina on 2024/05/19.
//

import SwiftUI

struct HomeView: View {
    @StateObject var posts: PostArrayObject
    @State var showCreatePostView = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(posts.dataArray, id: \.self) { post in
                    PostView(post: post)
                }
            }
        }
        .refreshable {
            posts.refreshAllUserPosts()
                }
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                showCreatePostView.toggle()
            }, label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .padding(20)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
            })
            .padding(10)
        }
        .sheet(
            isPresented: $showCreatePostView,
            onDismiss: posts.refreshAllUserPosts
        ) {
            CreatePostView()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            print("HomeView表示されました")
            posts.refreshAllUserPosts()
        }
    }
}

#Preview {
    HomeView(posts: PostArrayObject())
}
