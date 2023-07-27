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
}
