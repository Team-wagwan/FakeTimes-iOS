import SwiftUI

struct SecondGenerateView: View {
    @StateObject var viewModel = GenerateViewModel.shared
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                ZStack {
                    VStack {
                        Text("이미지")
                            .font(.title1Bold)
                            .foregroundStyle(Color.labelNormal)
                            .padding(.top, 80)
                        
                        ImagePickerBox()
                        
                        Spacer()
                        
                        CustomButton(title: "다음") {
                            withAnimation {
                                viewModel.pageNum = 2
                            }
                        }
                        .disabled(viewModel.model.img == nil)
                        .padding(.bottom, 70)
                        
                    }
                    
                    VStack {
                        HStack {
                            Button {
                                withAnimation {
                                    viewModel.pageNum -= 1
                                    viewModel.model.img = nil
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
    SecondGenerateView()
}
