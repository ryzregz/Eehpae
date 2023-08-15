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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSignupTopLabelText()
        
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
    
    
    
}

extension RegistrationVC{
    @objc func handleSignInTap(_ gesture : UITapGestureRecognizer){
        
    }
}
