import SwiftUI
import WebKit

struct NewsDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let url: String
    
    var body: some View {
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
        }
    }
}

#Preview {
    NavigationView {
        NewsDetailView(url: "https://github.com/lsh1202")
    }
}
