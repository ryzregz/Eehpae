//
//  RegistrationVC.swift
//  EehPae
//
//  Created by MacOS on 11/08/2023.
//

import Foundation
import UIKit

class RegistrationVC : UIViewController{
    
    @IBOutlet weak var lblSignup: UILabel!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var btnCheckBox : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSignupTopLabelText()
        
        setupTermsLabel()
        
        phoneNumberTextField.setPadding(left: 50)
        
        btnCheckBox.setImage(UIImage(named:"icons8-tick-box-30"), for: .normal)
                   btnCheckBox.setImage(UIImage(named:"tick-box-30 1"), for: .selected)
        
    }
    
    func setupSignupTopLabelText(){
        let text = "Create an account so you can manage  your money even faster. Sign In."
        lblSignup.text = text
        self.lblSignup.textColor =  ColorsConfig.normalText
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Sign In.")
             underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: ColorsConfig.buttonTextColor, range: range1)
        lblSignup.attributedText = underlineAttriString
        lblSignup.isUserInteractionEnabled = true
        lblSignup.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(handleSignInTap(_:))))
    }
    
    
    func setupTermsLabel(){
        let text = "I'm at least 18 years old and agree to the following terms. By tapping Next, I've read and agree to the E-Sign Disclosure  and Consent to receive all communication electrionically."
        lblTerms.text = text
        self.lblTerms.textColor =  ColorsConfig.normalText
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "E-Sign Disclosure  and Consent")
             underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: ColorsConfig.buttonTextColor, range: range1)
        lblTerms.attributedText = underlineAttriString
        lblTerms.isUserInteractionEnabled = true
        lblTerms.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(handleEsignAndConsent(_:))))
    }
    
    @IBAction func checkMarkTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                    sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    
                }) { (success) in
                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                        sender.isSelected = !sender.isSelected
                        sender.transform = .identity
                    }, completion: nil)
                }
    }
}

extension RegistrationVC{
    @objc func handleSignInTap(_ gesture : UITapGestureRecognizer){
        print("Sign In clicked")
    }
    
    @objc func handleEsignAndConsent(_ gesture : UIGestureRecognizer){
        print("Consent clicked")
    }
}
