public protocol AuthQueryProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<SignInResponse, Error>) -> Void)
}
