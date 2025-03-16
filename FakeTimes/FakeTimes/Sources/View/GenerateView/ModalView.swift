import SwiftUI

struct ModalView: View {
    @StateObject var viewModel = GenerateViewModel.shared
    @Binding var isActive: Bool
    @Binding var isGenerated: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("뉴스를 생성하시겠습니까?")
                .font(.headline2Bold)
                .foregroundStyle(Color.labelNormal)
            
            Text("생성 후에는 수정이 불가능해요")
                .font(.captionMedium)
                .foregroundStyle(Color.statusError)
            
            Text(viewModel.model.name)
                .font(.bodyMedium)
                .foregroundStyle(Color.labelNormal)
                .padding(.top)
            
            Text(viewModel.model.topic)
                .lineLimit(1)
                .font(.labelMedium)
                .foregroundStyle(Color.labelAssistive)
            
            HStack(spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 163, height: 57)
                        .foregroundStyle(Color.secondaryNormal)
                        .overlay {
                            Text("수정하기")
                                .foregroundStyle(Color.labelDisable)
                                .font(.bodyBold)
                        }
                }
                
                Button {
                    viewModel.uploadImage() {
                        withAnimation {
                            viewModel.pageNum = 5
                        }
                    }
                    dismiss()
                    withAnimation {
                        viewModel.pageNum = 4
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isActive = true
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 163, height: 57)
                        .foregroundStyle(Color.primaryNormal)
                        .overlay {
                            Text("생성하기")
                                .foregroundStyle(Color.labelDisable)
                                .font(.bodyBold)
                        }
                }
            }
            .padding(.top, 25)
        }
        .presentationDetents([.height(250)])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    ModalView(isActive: .constant(false), isGenerated: .constant(false))
}
