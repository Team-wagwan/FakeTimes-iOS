import Foundation
import SwiftUI
import Alamofire

class NewsViewModel: ObservableObject {
    static let shared = NewsViewModel()
    
    @Published var model = NewsModel()

    func getNews() {
        AF.request("\(Bundle.main.url)/kkangtong", method: .get)
            .responseDecodable(of: NewsModel.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.model = data
                    }
                case .failure(let error):
                    print("디코딩 실패: \(error.localizedDescription)")
                }
            }
    }
}

