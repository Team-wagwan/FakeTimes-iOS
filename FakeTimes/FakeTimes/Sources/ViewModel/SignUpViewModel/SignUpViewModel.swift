import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var model = SignUpModel()
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var successMessage: String?
    
    func signUp() {
        guard !model.email.isEmpty, !model.password.isEmpty, !model.name.isEmpty else {
            errorMessage = "모든 필드를 입력해주세요."
            return
        }
        
        guard let url = URL(string: "\(Bundle.main.url)/auth/sign-up") else {
            errorMessage = "잘못된 URL입니다."
            return
        }
        
        do {
            let jsonData = try JSONEncoder().encode(model)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            isLoading = true
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = "회원가입 실패: \(error.localizedDescription)"
                    }
                    return
                }
                
                // 응답 상태 출력
                if let response = response {
                    print("Response: \(response)")
                }
                
                // 응답 데이터 출력
                if let data = data {
                    print("Data: \(String(data: data, encoding: .utf8) ?? "")")
                }
                
                // HTTP 응답 상태 코드 확인
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    if httpResponse.statusCode == 200 {
                        DispatchQueue.main.async {
                            self.successMessage = "회원가입 성공"
                            self.errorMessage = nil
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.errorMessage = "회원가입 실패: 상태 코드 \(httpResponse.statusCode)"
                        }
                    }
                }
            }

            
            task.resume()
            
        } catch {
            errorMessage = "데이터 변환 오류: \(error.localizedDescription)"
        }
    }
}
