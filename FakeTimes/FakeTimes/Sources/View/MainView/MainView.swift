import SwiftUI

enum Tab {
    case news
    case generate
    case profile
}

struct MainView: View {
    @State var selectedTab: Tab = .news
    @StateObject var newsViewModel = NewsViewModel.shared
    @StateObject var profileViewModel = ProfileViewModel.shared
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
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
                .onAppear {
                    newsViewModel.getNews()
                    profileViewModel.getProfile()
                }
            }
    }
}

#Preview {
    MainView()
}
