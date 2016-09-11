//
//  WDTextField.swift
//  WeeDoo
//
//  Created by HoangHa on 5/8/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit
@IBDesignable
class WDTextField: UITextField {
   @IBInspectable var inset: CGFloat = 0
//     var inset: CGFloat = 50
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func addLeftView(imageName : String){
        
        let placeholderString = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        self.attributedPlaceholder = placeholderString

        
        let leftImageView : UIImageView = UIImageView (image: UIImage(named: imageName))
        self.leftView = leftImageView
        self.leftViewMode = UITextFieldViewMode.Always
    }
    

    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, 0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, 0)
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, 0)
    }
}
