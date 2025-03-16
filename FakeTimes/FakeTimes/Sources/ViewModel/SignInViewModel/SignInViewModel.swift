import Foundation
import Alamofire
import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var model = SignInModel()
    
    func signIn() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let nextVC = UIHostingController(rootView: NavigationView { MainView() })
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
        
        AF.request(
            "\(Bundle.main.url)/auth/sign-in",
            method: .post,
            parameters: model.params,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .responseJSON { response in
            print(response)
        }
        .responseDecodable(of: StatusModel<TokenModel>.self) { response in
            
            switch response.result {
            case .success(let result):
                
                if let data = result.data {
                    if KeyChain.create(token: data) {
                        viewController.present(nextVC, animated: true)
                    }
                    else {
                        
                    }
                }
               
                
            case .failure(_):
                break
            }
        }
    }
}
