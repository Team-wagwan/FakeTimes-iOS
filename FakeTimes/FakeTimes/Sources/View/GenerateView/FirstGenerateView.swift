import SwiftUI

struct FirstGenerateView: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 60) {
            Image("GenerateIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .offset(y: isAnimating ? 20 : 0)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true)) {
                        isAnimating = true
                    }
                }
            
            CustomButton(title: "생성하기") {
                
            }
        }
    }
}

#Preview {
    FirstGenerateView()
}
