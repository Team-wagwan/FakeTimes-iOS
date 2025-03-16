import SwiftUI
import WebKit

struct NewsDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let url: String
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                VStack {
                    WebViewer(url: url)
                }
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
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
            }
    }
}

#Preview {
    NavigationView {
        NewsDetailView(url: "https://github.com/lsh1202")
    }
}
