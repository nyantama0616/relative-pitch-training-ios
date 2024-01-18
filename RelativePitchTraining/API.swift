public struct API {
    static let baseURL = "http://localhost:3000"
    static let ping = "\(baseURL)/test/ping"
    
    public struct user {
        public static let fetchAll = "\(API.baseURL)/users"
    }
}
