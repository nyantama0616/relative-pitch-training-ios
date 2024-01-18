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
}
