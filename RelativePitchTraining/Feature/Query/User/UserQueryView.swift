import Foundation
import SwiftUI

public struct UserQueryView: View {
    @ObservedObject var viewModel: UserQueryViewModel
    
    public var body: some View {
        ZStack {
            VStack {
                Button("Fetch All") {
                    viewModel.fetchAll()
                }
            }
        }
    }
}

#Preview {
    UserQueryView(viewModel: UserQueryViewModel())
}
