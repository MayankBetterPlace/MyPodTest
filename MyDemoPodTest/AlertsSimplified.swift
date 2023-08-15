
import UIKit

extension UIViewController {
    /**
     This ia an extension method that displays an alert controller over the current UIViewController.
     - parameter title: An object of AlertTitle, title to display in the alert controller (default is the Application's name).
     - parameter message: An object of Messages, message to display in the alert controller.
     - parameter completionOnPresentationOfAlert: A closure that needs to be executed on presentation of the alert controller (default is nil).
     - parameter buttons: Comma seperated objects of AlertButton to be added to the alert controller
     */
    func showAlertControllerWith(title: String = "My App", message: String,
                                 completionOnPresentationOfAlert: NullableCompletion = nil) {
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
             
            }
            alertController.addAction(alertAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: completionOnPresentationOfAlert)
        }
    }
    
    /**
     Method to show a image in zoomed in method so that the user can zoom and see the whole image in detailed manner
     - parameter message: Message to display over the error popup
     - parameter code: Error or response https code
     */
    func displayWebserviceError(message: String, with code: Int) {
        if code != 404 {
            showAlertControllerWith(message: message)
        }
    }
}


