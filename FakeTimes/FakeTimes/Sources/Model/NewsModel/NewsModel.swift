import Foundation

struct NewsModel: Codable {
    var status: Int = 0
    var message: String = ""
    var data: [Datum] = []
}

struct Datum: Codable {
    var title: String = ""
    var author: String = ""
    var image: String = ""
    var url: String?
}
