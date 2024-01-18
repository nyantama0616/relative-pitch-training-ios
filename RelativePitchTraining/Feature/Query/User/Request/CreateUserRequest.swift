public struct CreateUserRequest: Encodable {
    let userName: String
    let email: String
    let password: String
}
