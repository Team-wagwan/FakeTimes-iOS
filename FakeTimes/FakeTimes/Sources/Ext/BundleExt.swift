import Foundation

extension Bundle {
    var url: String {
        guard let file = self.path(forResource: "ApiContent", ofType: "plist") else {
            return ""
        }
        guard let resource = NSDictionary(contentsOf: URL(fileURLWithPath: file)) else {
            return ""
        }
        
        let url = "\(resource["URL"]!):\(resource["PORT"]!)"
        
        return url
    }
}


