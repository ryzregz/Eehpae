//
//  CustomImageView.swift
//  RydeEssays
//
//  Created by Eclectics on 08/04/2021.
//

import Foundation
import UIKit
class RoundedImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        //
        
    }
}
