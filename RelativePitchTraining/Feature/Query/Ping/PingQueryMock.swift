struct PingQueryMock: PingQueryProtocol {
    let error: Error?

    init(error: Error? = nil) {
        self.error = error
    }

    public func send(completion: @escaping (Result<PingResponse, Error>) -> Void) {
        if error != nil {
            completion(.failure(error!))
            return
        }
        
        let mockResponse = PingResponse(message: "pong(mock)")
        completion(.success(mockResponse))
    }
}
