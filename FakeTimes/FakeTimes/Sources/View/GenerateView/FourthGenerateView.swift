import SwiftUI

struct FourthGenerateView: View {
    @StateObject var viewModel = GenerateViewModel.shared
    @State private var showModal: Bool = false
    @State private var isNavigationActive = false
    @State private var isGenerated = false
    
    var body: some View {
        NavigationStack {
            Color.backgroundAlternative
                .ignoresSafeArea()
                .overlay {
                    ZStack {
                        VStack {
                            Text("주제")
                                .font(.title1Bold)
                                .foregroundStyle(Color.labelNormal)
                                .padding(.top, 80)
                            
                            InputField(text: $viewModel.model.topic, placeholder: "보도 주제를 입력해주세요", style: .default, label: "")
                                .padding(.top)
                            
                            Spacer()
                            
                            CustomButton(title: "생성하기") {
                                withAnimation {
                                    showModal.toggle()
                                }
                            }
                            .disabled(viewModel.model.topic.isEmpty)
                            .padding(.bottom, 70)
                        }
                        .sheet(isPresented: $showModal) {
                            ModalView(isActive: $isNavigationActive, isGenerated: $isGenerated)
                        }
                    
                        VStack {
                            HStack {
                                Button {
                                    withAnimation {
                                        viewModel.pageNum -= 1
                                        viewModel.model.topic = ""
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
}


#Preview {
    FourthGenerateView()
}
