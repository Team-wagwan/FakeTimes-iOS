import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack {
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("생성한 뉴스")
                    .font(.title2Bold)
            }
        }
    }
}

#Preview {
    NavigationView {
        NewsView()
    }
}
