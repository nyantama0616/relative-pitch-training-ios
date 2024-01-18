public protocol UserQueryProtocol {
    func fetchAll(completion: @escaping (Result<FetchAllUsersResponse, Error>) -> Void)
}
