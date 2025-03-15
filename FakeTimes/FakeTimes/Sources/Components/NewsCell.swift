//
//  NewsCell.swift
//  FakeTimes
//
//  Created by hyk on 3/15/25.
//

import SwiftUI
import Kingfisher

struct NewsCell: View {
    let imgUrl: String
    let title: String
    let content: String
    let link: String
    
    var body: some View {
        NavigationLink(destination: Text("상세화면")) {
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(height: 85)
                    .overlay {
                        HStack(spacing: 25) {
                            KFImage(URL(string: imgUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Spacer()
                                
                                Text(title)
                                    .font(.bodyBold)
                                Text(content)
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
        NewsCell(imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPRe05b-7ElyXcgDeI3kOzX0S7z-ySzDDEjQ&s", title: "제목제목제목", content: "내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용", link: "www.youtube.com")
    }
}
