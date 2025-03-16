import Foundation
import Alamofire

class ProfileViewModel: ObservableObject {
    static let shared = ProfileViewModel()
    
    @Published var model = ProfileModel()
    
    func getProfile() {
        AF.request("\(Bundle.main.url)/user", method: .get, headers: ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"])
            .responseDecodable(of: ProfileModel.self) { response in
                switch response.result {
                case .success(let data):
                    self.model = data
                    print(self.model.data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
