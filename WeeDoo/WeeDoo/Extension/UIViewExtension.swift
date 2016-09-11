//
//  UIViewExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 6/9/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

extension UIView {    
    func updateY(y: CGFloat) {
        let frame = self.frame
        let newFrame = CGRect(x: frame.minX, y: y, width: frame.size.width, height: frame.size.height)
        self.frame = newFrame
    }
    
    class func createCircularMaskForView(view: UIView, maskFrame: CGRect) {
        let mask = CALayer()
        let maskImage = UIImage(named: "mask")!
        mask.contents = maskImage.CGImage
        mask.frame = maskFrame
        view.layer.mask = mask
        view.layer.masksToBounds = true
    }
    
    class func createRoundedMaskForView(view: UIView, roundedRect: CGRect, roundingCorners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        // maskLayer uses frame of path
        maskLayer.path = maskPath.CGPath
        maskLayer.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).CGColor
        view.layer.addSublayer(maskLayer)
        view.layer.masksToBounds = true
    }
    
    func roundViewAtCorners(rectCorner: UIRectCorner, radii: CGSize, rect: CGRect) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: rect, byRoundingCorners: rectCorner, cornerRadii: radii).CGPath
        self.layer.mask = maskLayer
    }
    
    // Not use
    class func maskedImageFrom(image: UIImage) -> UIImage {
        let maskImage = UIImage(named: "mask")!
        let maskRef = maskImage.CGImage
        
        let mask = CGImageMaskCreate(CGImageGetWidth(maskRef), CGImageGetHeight(maskRef), CGImageGetBitsPerComponent(maskRef), CGImageGetBitsPerPixel(maskRef), CGImageGetBytesPerRow(maskRef), CGImageGetDataProvider(maskRef), nil, false)
        let masked = CGImageCreateWithMask(image.CGImage, mask)
        
        // Create image from CGImageRef
        let maskedImage = UIImage(CGImage: masked!)
        return maskedImage
    }
}