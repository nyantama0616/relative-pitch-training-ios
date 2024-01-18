import Foundation

public struct UserQuery: UserQueryProtocol {
    public func fetchAll(completion: @escaping (Result<FetchAllUsersResponse, Error>) -> Void) {
        let url = URL(string: API.user.fetchAll)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            print(data!)

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

    public func create(userName: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = URL(string: API.user.create)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(CreateUserRequest(userName: userName, email: email, password: password))
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 201 {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "something wrong"])))
                return
            }

            completion(.success(()))
        }
        task.resume()
    }
}
