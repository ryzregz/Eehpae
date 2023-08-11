//
//  Extensions.swift
//  RydeEssays
//
//  Created by Eclectics on 30/03/2021.
//

import Foundation
import UIKit
var showAlert: UIAlertController?
extension UIViewController{
    func removeSeparator(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func showSuccessAlert(withTitle title: String, message:String, completion:@escaping (_ result:Bool) -> Void) {
        let attributedString = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.green])
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: UIAlertController.Style.alert)
         alert.setValue(attributedString, forKey: "attributedTitle")
        alert.view.tintColor = .white
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completion(true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showErrorAlert(withTitle title: String, message:String, completion:@escaping (_ result:Bool) -> Void) {
         let attributedString = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.red])
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: UIAlertController.Style.alert)
         alert.setValue(attributedString, forKey: "attributedTitle")
        alert.view.tintColor = .red
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completion(true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func dismissLoadingMessageAlert() {
           self.dismissMessageAlert(nil)
       }
    
    func dismissMessageAlert(_ completion: (() -> Void)? = nil) {
          self.dismiss(animated: true, completion: { () -> Void in
              showAlert = nil
              completion?()
              // print("completion value: \(String(describing: completion))")
          })
      }
}

extension Double{
    func toCGFloaf() -> CGFloat{
        let ns = NSNumber(value: self)
        return CGFloat(exactly: ns)!
    }
}

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}



