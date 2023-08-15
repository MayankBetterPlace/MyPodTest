

//This file contains all the API URLs that we have used in the app.
enum UserEndpoints: Endpoints {

    case login([String: Any]), publicApi
    
    internal var url: String {
        switch self {
        case .login: return "\(base)/user/login"
        case .publicApi: return "https://api.publicapis.org/entries"
        }
    }
    
    internal var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .publicApi:
            return .get
        }
    }
    
    internal var parameters: [String: Any]? {
        switch self {
        case .login(let params):
            return params
        default :
            return nil
        }
    }
}
