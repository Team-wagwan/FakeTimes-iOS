//
//  ShowResultView.swift
//  FakeTimes
//
//  Created by hyk on 3/16/25.
//

import SwiftUI

public func copyToClipboard(_ text: String) {
    
    guard !text.isEmpty else {
        return
    }

    if UIPasteboard.general.hasStrings {
        UIPasteboard.general.string = text
    } else {
        
    }
}

struct ShowResultView: View {
    @StateObject var viewModel = GenerateViewModel.shared
    
    let url: String
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                ZStack {
                    VStack {
                        WebViewer(url: url)
                    }
                    .navigationBarBackButtonHidden()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                self.viewModel.pageNum = 0
                                self.viewModel.model.img = nil
                                self.viewModel.model.name = ""
                                self.viewModel.model.topic = ""
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(Color.labelNormal)
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                copyToClipboard(url)
                            } label: {
                                HStack {
                                    Image(systemName: "link")
                                    
                                    Text("링크 복사하기")
                                }
                                .foregroundStyle(Color.primaryNormal)
                                .font(.bodyMedium)
                            }
                        }
                    }
                    
                    VStack {
                        Spacer()
                        
                        Button {
                            copyToClipboard(url)
                        } label: {
                            Capsule()
                                .foregroundStyle(Color.backgroundNormal)
                                .frame(width: 150, height: 50)
                                .shadow(radius: 5)
                                .overlay {
                                    HStack {
                                        Image(systemName: "link")
                                        
                                        Text("링크 복사하기")
                                    }
                                    .foregroundStyle(Color.primaryNormal)
                                    .font(.bodyMedium)
                                }
                        }
                    }
                }
            }
    }
}

#Preview {
    ShowResultView(url: "")
}
