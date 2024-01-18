import Foundation

public struct AuthQuery: AuthQueryProtocol {
    public func signIn(email: String, password: String, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
        let url = URL(string: API.auth.signIn)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(SignInRequest(email: email, password: password))
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "something wrong"])))
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(SignInResponse.self, from: data!)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
