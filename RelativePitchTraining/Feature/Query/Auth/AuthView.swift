import SwiftUI

public struct AuthView: View {
    @ObservedObject var viewModel: AuthViewModel
    
    public var body: some View {
        VStack {
            Text("Auth")
                .font(.title)
                .padding()
            if let user = viewModel.currentUser {
                Text("Signed in as \(user.toString())")
            } else {
                Button(action: {
                    viewModel.signIn()
                }) {
                    Text("Sign in")
                }
            }
            if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    AuthView(viewModel: AuthViewModel())
}
