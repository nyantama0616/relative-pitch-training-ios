public struct API {
    static let baseURL = "http://localhost:3000"
    static let ping = "\(baseURL)/test/ping"
    
    public struct user {
        public static let fetchAll = "\(API.baseURL)/users"
        public static let create = "\(API.baseURL)/users"
    }

    public struct auth {
        public static let signIn = "\(API.baseURL)/signin"
    }
}
