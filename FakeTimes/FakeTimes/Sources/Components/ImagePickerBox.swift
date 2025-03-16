import SwiftUI

struct ImagePickerBox: View {
    @StateObject var viewModel = GenerateViewModel.shared
    
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            if let image = viewModel.model.img {
                VStack(spacing: 15) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 310, height: 310)
                    
                    Button {
                        viewModel.model.img = nil
                    } label: {
                        HStack {
                            Text("삭제하기")
                                .font(.bodyMedium)
                            
                            Image(systemName: "xmark")
                                .fontWeight(.medium)
                        }
                        .foregroundStyle(Color.primaryNormal)
                    }
                }
            } else {
                Button {
                    showImagePicker.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 310, height: 310)
                        .foregroundColor(.clear)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .tint(.lineNormal)
                            
                            VStack(spacing: 20) {
                                Image(systemName: "square.and.arrow.up")
                                
                                Text("포스트에 사용할 이미지를 선택해주세요.")
                            }
                            .foregroundStyle(Color.labelAssistive)
                        }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    
                }) {
                    ImagePicker(image: $viewModel.model.img)
                }
            }
        }
    }
}

#Preview {
    ImagePickerBox()
}
