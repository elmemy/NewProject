//
//  Alert.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import UIKit
class Alert {
    
    class func showAlert(target: UIViewController, title: String, message: String, okAction: String, actionCompletion: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okAction, style: .default, handler: actionCompletion))
        target.present(alert, animated: true, completion: nil)
    }
    
    
    class func showAlertOnVC(target: UIViewController, title: String, message: String) {
        let title = title
        let message = message
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back".localized(), style: .default, handler: nil))
        target.present(alert, animated: true, completion: nil)
    }
    
  
    
}
