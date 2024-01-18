public protocol PingQueryProtocol {
    func send(completion: @escaping (Result<PingResponse, Error>) -> Void)
}
