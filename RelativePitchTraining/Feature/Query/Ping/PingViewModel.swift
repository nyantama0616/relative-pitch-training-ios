import Foundation

public class PingViewModel: ObservableObject {
    @Published private var model = PingModel()
    @Published var error: Error?
    private var pingQuery: PingQueryProtocol

    var message: String? {
        self.model.message
    }

    init(pingQuery: PingQueryProtocol = PingQuery()) {
        self.pingQuery = pingQuery
    }
    
    public func send() {
        pingQuery.send { result in
            switch result {
            case .success(let data):
                self.model.message = data.message
            case .failure(let error):
                print("Error: \(error)")
                self.error = error
            }
        }
    }

    public func reset() {
        self.model.message = nil
        self.error = nil
    }
}
