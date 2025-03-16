import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                VStack(spacing: 30) {
                    Image("textLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.vertical)
                    
                    InputField(text: $viewModel.model.email, placeholder: "이메일을 입력해주세요", style: .default, label: "이메일")
                    
                    InputField(text: $viewModel.model.password, placeholder: "비밀번호를 입력해주세요", style: .default, label: "비밀번호")
                    
                    InputField(text: $viewModel.model.name, placeholder: "이름을 입력해주세요", style: .default, label: "이름")
                    
                    CustomButton(title: "회원가입") {
                        viewModel.signUp()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                            viewModel.model.email = ""
                            viewModel.model.password = ""
                            viewModel.model.name = ""
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.labelNormal)
                        }
                    }
                }
            }
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}
