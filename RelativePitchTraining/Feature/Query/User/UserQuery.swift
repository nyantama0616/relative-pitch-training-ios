import Foundation

public struct UserQuery: UserQueryProtocol {
    public func fetchAll(completion: @escaping (Result<FetchAllUsersResponse, Error>) -> Void) {
        let url = URL(string: API.user.fetchAll)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode(FetchAllUsersResponse.self, from: data!)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
