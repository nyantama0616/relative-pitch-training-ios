import Foundation

struct PingQuery: PingQueryProtocol {
    public func send(completion: @escaping (Result<PingResponse, Error>) -> Void) {
        let request = URLRequest(url: URL(string: API.ping)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let decoder = JSONDecoder()
                if let decodedResponse = try? decoder.decode(PingResponse.self, from: data) {
                    completion(.success(decodedResponse))
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Decoding failed"])
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
