//
//  MyData.swift
//  MyDemoPodTest
//
//  Created by Mayank Sharma on 25/07/23.
//

import UIKit


open class MyData {
    public static func printCommand() {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print("This is just a demo SDK and this function can only print data")
    }
    
    public static func showAlert(controller: UIViewController) {
        var dialogMessage = UIAlertController(title: "Attention", message: "I am an alert message to show SDK is working", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        dialogMessage.addAction(ok)
            controller.present(dialogMessage, animated: true, completion: nil)
    }
    
    public static func callAPI() {
        UserEndpoints.publicApi.request { data in
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            let arrDict = data["entries"] as? [[String:Any]] ?? []
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController else {return}
            vc.modalPresentationStyle = .overFullScreen
            vc.myData = arrDict
            window?.rootViewController?.present(vc, animated: true)
        }
    }
}
