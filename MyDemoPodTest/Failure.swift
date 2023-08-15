
import UIKit

typealias NullableCompletion = (()->Void)?

struct Failure {
    
    static let handler = Failure()
    private init() {}
    
    func handleErronous(response: HTTPURLResponse) {
        if let statusCode = response.statusCode as? Int {
            switch statusCode {
            default:
                handle(message: "Unknown Error Occurred")
            }
        } else {
            showAlertWith(message: "Unknown Error Occurred")
        }
    }
    
    func handle(message: String?) {
        showAlertWith(message: message ?? "")
    }
    
    func handle(error: Error) {
        Indicator.shared.hide()
        showAlertWith(message: error.localizedDescription)
    }
    
    private func showAlertWith(message: String?, action: NullableCompletion = nil) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        DispatchQueue.main.async {
            window?.rootViewController?.showAlertControllerWith(message: message ?? "")
        }
    }
}
