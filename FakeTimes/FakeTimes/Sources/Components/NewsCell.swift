//
//  NewsCell.swift
//  FakeTimes
//
//  Created by hyk on 3/15/25.
//

import SwiftUI

struct NewsCell: View {
    let imgUrl: String
    let title: String
    let author: String
    let link: String
    
    var body: some View {
        NavigationLink(destination: NewsDetailView(url: link)) {
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(Color.backgroundAlternative)
                    .frame(height: 85)
                    .overlay {
                        HStack(spacing: 25) {
                            if imgUrl != nil, let url = URL(string: imgUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 60, height: 60)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Spacer()
                                
                                Text(title)
                                    .font(.bodyBold)
                                Text(author)
                                    .font(.captionRegular)
                                    .lineLimit(1)
                            }
                            .foregroundStyle(Color.labelNormal)
                            .padding(.bottom)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                Divider()
            }
        }
    }
}

#Preview {
    NavigationView {
        NewsCell(imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPRe05b-7ElyXcgDeI3kOzX0S7z-ySzDDEjQ&s", title: "제목제목제목", author: "", link: "www.youtube.com")
    }
}
