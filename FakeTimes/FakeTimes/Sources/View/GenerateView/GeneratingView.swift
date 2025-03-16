import SwiftUI

struct GeneratingView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("sigma")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            Text("뉴스를 생성하고 있어요...")
                .font(.headline2Bold)
                .foregroundStyle(Color.labelNormal)
                .padding(.top, 30)
            
            Text("20~30초 정도 소요되니 잠시만 기다려주세요")
                .font(.labelMedium)
                .foregroundStyle(Color.labelAssistive)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GeneratingView()
}
