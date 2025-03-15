import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            InputField(text: $viewModel.model.email, placeholder: "이메일을 입력해주세요", style: .default, label: "이메일")
            
            InputField(text: $viewModel.model.password, placeholder: "비밀번호를 입력해주세요", style: .secureField, label: "비밀번호")
            
            CustomButton(title: "로그인") {
                viewModel.signIn()
            }
            .padding(.vertical, 10)
            
            HStack(spacing: 5){
                Text("계정이 없으신가요?")
                
                NavigationLink(destination: SignUpView()) {
                    Text("회원가입하기")
                    
                }
            }
            .font(.captionMedium)
        }
    }
}

#Preview {
    NavigationView {
        SignInView()
    }
}
