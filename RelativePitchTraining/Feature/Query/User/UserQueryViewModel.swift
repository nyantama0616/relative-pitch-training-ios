import Foundation

public class UserQueryViewModel: ObservableObject {
    let userQuery = UserQuery()

    public func fetchAll() {
        userQuery.fetchAll { result in
            switch result {
            case .success(let data):
                for user in data.users {
                    print(user.toString())
                }

            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    public func create() {
        let email = "eee@example.com"
        userQuery.create(userName: "test", email: email, password: "pass") { result in
            switch result {
            case .success:
                print("Success: \(email)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
