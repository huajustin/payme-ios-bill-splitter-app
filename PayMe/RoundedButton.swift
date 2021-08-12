//
//  RoundedButton.swift
//  PayMe
//
//  Created by Justin Hua on 2021-08-12.
//  Copyright © 2021 Justin Hua. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         Drawing code
    }
    */
    
     override func layoutSubviews() {
           super.layoutSubviews()

           updateCornerRadius()
       }

       @IBInspectable var rounded: Bool = false {
           didSet {
               updateCornerRadius()
           }
       }

       func updateCornerRadius() {
           layer.cornerRadius = rounded ? frame.size.height / 2 : 0
       }
}
