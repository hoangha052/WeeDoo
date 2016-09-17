//
//  UIImageExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 7/4/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

extension UIImage {
    func roundedImageWithSize(size: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPointZero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        CGContextAddPath(UIGraphicsGetCurrentContext(), UIBezierPath(roundedRect: rect, cornerRadius: size.width/2).CGPath)
        
        CGContextClip(UIGraphicsGetCurrentContext())
        self.drawInRect(rect)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return output
    }
}
