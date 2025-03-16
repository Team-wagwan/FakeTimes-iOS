import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Divider()
            
            HStack {
                Spacer()
                
                Button {
                    selectedTab = .news
                } label: {
                    Image(selectedTab == .news ? "NewsFill" : "NewsNormal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                }
                
                Spacer()
                
                Button {
                    selectedTab = .generate
                } label: {
                    Image(selectedTab == .generate ? "GenerateFill" : "GenerateNormal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                }
                
                Spacer()
                
                Button {
                    selectedTab = .profile
                } label: {
                    Image(selectedTab == .profile ? "ProfileFill" : "ProfileNormal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                }
                
                Spacer()
            }
            .frame(height: 90)
            .background(Color.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ZStack {
        Color.red
        
        CustomTabView(selectedTab: .constant(.generate))
            .ignoresSafeArea()
    }
}
