public protocol UserQueryProtocol {
    func fetchAll(completion: @escaping (Result<FetchAllUsersResponse, Error>) -> Void)
    func create(userName: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
