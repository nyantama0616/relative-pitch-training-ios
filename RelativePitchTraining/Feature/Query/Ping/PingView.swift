import Foundation
import SwiftUI

public struct PingView: View {
    @ObservedObject var viewModel: PingViewModel
    
    public var body: some View {
        VStack {
            Text(viewModel.message ?? "No message")
            if let error = viewModel.error {
                ErrorView(error: error)
            }
            HStack {
                Button("Send") {
                    viewModel.send()
                }
                
                Button("Reset") {
                    viewModel.reset()
                }
            }
        }
    }
}

#Preview {
    PingView(viewModel: PingViewModel())
//    PingView(viewModel: PingViewModel(pingQuery: PingQueryMock(error: NSError(domain: "test", code: 0, userInfo: nil))))
}
