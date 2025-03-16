import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel.shared
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                VStack(spacing: 30) {
                    Image("Banner")
                    
                    Image("baseProfile")
                    
                    HStack(spacing: 20) {
                        Text("이름")
                            .font(.headline2Bold)
                            .foregroundStyle(Color.labelNormal)
                        
                        Text(viewModel.model.data.name)
                            .font(.bodyMedium)
                            .foregroundStyle(Color.labelAssistive)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 25)
                    
                    HStack(spacing: 20) {
                        Text("이메일")
                            .font(.headline2Bold)
                            .foregroundStyle(Color.labelNormal)
                        
                        Text(viewModel.model.data.email)
                            .font(.bodyMedium)
                            .foregroundStyle(Color.labelAssistive)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 25)
                    
                    Button {
                        if KeyChain.delete() {exit()}
                    } label: {
                        HStack {
                            Text("로그아웃")
                            
                            Image(systemName: "chevron.right")
                            
                            Spacer()
                        }
                        .font(.headline2Bold)
                        .foregroundStyle(Color.statusError)
                        .padding(.horizontal, 25)
                    }
                    
                    Spacer()
                }
            }
    }
}

#Preview {
    NavigationView {
        ProfileView()
    }
}
