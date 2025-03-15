import SwiftUI

enum Tab {
    case news
    case generate
    case profile
}

struct MainView: View {
    @State var selectedTab: Tab = .news
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .news:
                Text("News")
            case .generate:
                Text("Generate")
            case .profile:
                Text("Profile")
            }
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainView()
}
