import SwiftUI

public struct ErrorView: View {
    let error: Error

    public var body: some View {
        ZStack {
            VStack {
                Text(error.localizedDescription)
                    .font(.title)
                    .foregroundColor(.red)
                Text("Type: \(String(describing: type(of: error)))")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
    }
}
