import Foundation

struct WebLinkResponse: Codable {
    var status: Int = 0
    var message: String?
    var data: String = ""
}
