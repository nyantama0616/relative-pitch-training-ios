public struct UserModel: Decodable {
    let id: Int
    let userName: String
    let email: String
    let imagePath: String

    public func toString() -> String {
        return "id: \(id), userName: \(userName), email: \(email), imagePath: \(imagePath)"
    }
}
