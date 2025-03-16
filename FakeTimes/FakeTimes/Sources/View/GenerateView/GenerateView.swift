import SwiftUI

struct GenerateView: View {
    @StateObject var viewModel: GenerateViewModel = .shared
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                if viewModel.pageNum == 0 {
                    FirstGenerateView()
                } else if viewModel.pageNum == 1 {
                    SecondGenerateView()
                } else if viewModel.pageNum == 2 {
                    ThirdGenerateView()
                } else if viewModel.pageNum == 3 {
                    FourthGenerateView()
                } else if viewModel.pageNum == 4 {
                    GeneratingView()
                } else if viewModel.pageNum == 5 {
                    ShowResultView(url: viewModel.linkModel.data)
                }
            }
    }
}

#Preview {
    GenerateView()
}
