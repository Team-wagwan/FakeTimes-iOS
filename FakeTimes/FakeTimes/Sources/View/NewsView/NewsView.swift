import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel.shared
    
    var body: some View {
        Color.backgroundAlternative
            .ignoresSafeArea()
            .overlay {
                VStack {
                    HStack {
                        Text("생성한 뉴스")
                            .font(.title2Bold)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack {
                            ForEach(0..<viewModel.model.data.count, id: \.self) { index in
                                NewsCell(imgUrl: viewModel.model.data[index].image, title: viewModel.model.data[index].title, author: viewModel.model.data[index].author, link: viewModel.model.data[index].url ?? "")
                            }
                        }
                    }
                    .padding(.bottom, 50)



                }
            }
            .onAppear {
                viewModel.getNews()
            }
    }
}

#Preview {
    NavigationView {
        NewsView()
    }
}
