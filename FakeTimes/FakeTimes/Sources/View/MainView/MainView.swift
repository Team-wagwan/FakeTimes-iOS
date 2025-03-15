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
                NewsView()
            case .generate:
                GenerateView()
            case .profile:
                ProfileView()
            }
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainView()
}
