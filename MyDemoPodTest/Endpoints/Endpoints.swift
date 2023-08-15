
import UIKit

protocol Endpoints {
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var header: [String: String] { get }
}


enum HTTPMethod {
    case get, post, put, delete
    var methodType: String {
        switch self {
        case .get : return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .delete: return "DELETE"
        }
    }
}

enum Enviroment {
    case dev, stage, prod
    var url: String {
        switch self {
        case .dev : return ""
        case .prod: return ""
        case . stage: return ""
        }
    }
}
typealias WebResponse = (NSDictionary) -> Void

//MARK: - Common Properties and Configurations
extension Endpoints {
    internal var base: String {
        return ""
    }
    
    var header: [String: String] {
        let headers = ["Authorization": "Authorization"]
        return headers
    }
}

//MARK: - Webservice Interaction Method
extension Endpoints {
    /**
     Method for interacting with the server for data
     - parameter api: Endpoints object for preferred data from the server
     - parameter withHiddenIndicator: True if you want to interact without the Loading indicator
     - parameter responseClosure: A Closure to handle the response from the server
     */
    func request(withHiddenIndicator: Bool = false,
                 withHiddenError: Bool = false,
                 responseClosure: @escaping WebResponse) {
        
        if !withHiddenIndicator {
            Indicator.shared.show()
        }
        
        printRequest(self)
        guard let urlRequest = URL(string: self.url) else {
            return
        }
        
        var rquest = URLRequest(url: urlRequest)
        rquest.httpMethod = self.method.methodType
        let task = URLSession.shared.dataTask(with: rquest) { data, response, error in
            if let data = data {
                let image = UIImage(data: data)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        task.resume()
    }
    
    private func printRequest(_ api: Endpoints) {
        debugPrint("********************************* API Request **************************************")
        debugPrint("Request URL:\(api.url)")
        debugPrint("Request Parameters: \(api.parameters ?? [: ])")
        debugPrint("Request Headers: \(api.header)")
    }
    
    private func handle(_ response: URLResponse?, _ dicData: Data?, _ error: Error?, _ withHiddenError: Bool, responseClosure: WebResponse) {
        debugPrint("Request Response:----------")
        debugPrint("************************************************************************************")
        let httpResponse = response as? HTTPURLResponse ?? HTTPURLResponse()
        if error != nil {
            Indicator.shared.hide()
            responseClosure([:])
            Failure.handler.handle(error: error!)
        } else if dicData != nil{
            Indicator.shared.hide()
            do {
                let value = try JSONSerialization.jsonObject(with: dicData!, options: [])
                guard let data = value as? NSDictionary else {
                    Failure.handler.handleErronous(response: httpResponse)
                    return
                }
                if let error = data["error"] as? NSDictionary {
                    Failure.handler.handle(message: error["msg"] as? String)
                    return
                }
                responseClosure(data)
            } catch {
                print(error)
            }
        }
    }
}
