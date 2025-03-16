import Foundation
import SwiftUI
import UIKit
import Alamofire

class GenerateViewModel: ObservableObject {
    static let shared = GenerateViewModel()
    
    @Published var model = GenerateModel()
    @Published var linkModel = WebLinkResponse()
    @Published var pageNum: Int = 0
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120
        configuration.timeoutIntervalForResource = 120
        return Session(configuration: configuration)
    }()

    func uploadImage(completion: @escaping () -> ()) {
        guard let imageData = model.img?.jpegData(compressionQuality: 0.8) else {
            print("이미지가 없습니다.")
            return
        }
        
        let parameters: [String: String] = [
            "text": model.name + model.topic
        ]
        
        print("이미지데이터: \(imageData)")
        print("파라미터: \(parameters)")
        
        session.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "file", fileName: "image.jpg", mimeType: "image/jpeg")
                
                for (key, value) in parameters {
                    multipartFormData.append(Data(value.utf8), withName: key)
                }
            },
            to: "\(Bundle.main.url)/kkangtong",
            method: .post,
            headers: ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
        )
        .responseJSON { json in
            print(json)
        }
        .responseDecodable(of: WebLinkResponse.self) { response in
            switch response.result {
            case .success(let data):
                if response.response?.statusCode == 200 {
                    print("이미지 업로드 성공")
                    self.linkModel = data
                    completion()
                } else {
                    print("이미지 업로드 실패, 상태 코드: \(response.response?.statusCode ?? 0)")
                    if let errorData = response.data {
                        print("서버 응답 데이터: \(String(data: errorData, encoding: .utf8) ?? "No data")")
                    }
                }
            case .failure(let error):
                print("업로드 실패, 에러: \(error)")
            }
        }
    }
}
