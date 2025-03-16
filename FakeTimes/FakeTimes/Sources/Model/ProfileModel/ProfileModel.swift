import Foundation

struct ProfileModel: Codable {
    var status: Int = 0
    var message: String = ""
    var data: ProfileInfo = ProfileInfo()
}

struct ProfileInfo: Codable {
    var email: String = ""
    var name: String = ""
}

