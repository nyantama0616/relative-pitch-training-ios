import SwiftUI

public class AuthViewModel: ObservableObject {
    @Published private var model = AuthModel()
    @Published var error: Error?
    private var authQuery: AuthQueryProtocol

    var currentUser: UserModel? {
        self.model.currentUser
    }
    
    
    init(authQuery: AuthQueryProtocol = AuthQuery()) {
        self.authQuery = authQuery
    }
    
    func signIn() {
        let email = "test@example.com"
        let password = "pass"
        self.authQuery.signIn(email: email, password: password) { result in
            switch result {
            case .success(let response):
                print("Success to sign in: \(response.user.toString())")
                self.model.currentUser = response.user
            case .failure(let error):
                print("Error: \(error)")
                self.error = error
            }
        }
    }
}
