//
//  ProfileHeaderView.swift
//  PositiveWordsCollection
//
//  Created by Hina on 2024/05/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var profileUserID: String
    @Binding var profileDisplayName: String
    @Binding var profileImage: UIImage
    let profileBio: String
    var isMyProfile: Bool
    @StateObject var posts: PostArrayObject

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            // MARK: PROFILE PICTURE
            HStack(alignment: .center, spacing: 20) {
                Image(uiImage: profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80, alignment: .leading)
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                    .overlay {
                        RoundedRectangle(cornerRadius: 60)
                            .stroke(Color.black, lineWidth: 1.0)
                    }
                // MARK: USER NAME
                Text(profileDisplayName)
                    .font(.title)
                    .fontWeight(.bold)
            }

            // MARK: BIO
            if profileBio != "" {
                Text(profileBio)
                    .font(.title3)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
            }
            HStack(alignment: .center, spacing: 50) {
                // MARK: POSTS
                VStack(alignment: .center, spacing: 5) {
                    HStack {
                        Image(systemName: "paperplane")
                        if isMyProfile == true {
                            Text(posts.myPostCount)
                                .font(.title2)
                                .fontWeight(.bold)
                        } else {
                            Text(posts.userPostCount)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }

                    Capsule()
                        .fill(.gray)
                        .frame(width: 60, height: 3, alignment: .center)

                    Text("ポスト数")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                // MARK: LIKES
                VStack(alignment: .center, spacing: 5) {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                        if isMyProfile == true {
                            Text(posts.myLikeCount)
                                .font(.title2)
                                .fontWeight(.bold)
                        } else {
                            Text(posts.userLikeCount)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                    Capsule()
                        .fill(.red)
                        .frame(width: 60, height: 3, alignment: .center)
                    Text("いいね数")
                        .font(.callout)
                        .fontWeight(.medium)
                }
            }
        }
    }
}

#Preview {
    @State var name: String = "hina"
    var id: String = "1546332242422"
    let bio = "iOSエンジニア目指して学習をしています。"
    @State var image = UIImage(named: "posiIcon")!
    return ProfileHeaderView(profileUserID: id, profileDisplayName: $name, profileImage: $image, profileBio: bio, isMyProfile: true, posts: PostArrayObject())
}
