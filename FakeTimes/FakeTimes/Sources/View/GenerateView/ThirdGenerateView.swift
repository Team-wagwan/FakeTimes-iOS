import SwiftUI

struct ThirdGenerateView: View {
    @StateObject var viewModel = GenerateViewModel.shared
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                ZStack {
                    VStack {
                        Text("이름")
                            .font(.title1Bold)
                            .foregroundStyle(Color.labelNormal)
                            .padding(.top, 80)
                        
                        InputField(text: $viewModel.model.name, placeholder: "보도 대상의 이름을 입력해주세요", style: .default, label: "")
                            .padding(.top)
                        
                        Spacer()
                        
                        CustomButton(title: "다음") {
                            withAnimation {
                                viewModel.pageNum = 3
                            }
                        }
                        .disabled(viewModel.model.name == "")
                        .padding(.bottom, 70)
                        
                    }
                    
                    VStack {
                        HStack {
                            Button {
                                withAnimation {
                                    viewModel.pageNum -= 1
                                    viewModel.model.name = ""
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundStyle(Color.labelNormal)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                }
            }
    }
}

#Preview {
    ThirdGenerateView()
}
