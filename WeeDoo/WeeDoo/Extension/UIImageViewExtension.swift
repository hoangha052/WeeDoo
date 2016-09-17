//
//  UIImageViewExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 7/4/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    var colorPattern: String? {
        get {
            return nil
        }
        
        set {
            self.backgroundColor = UIColor(patternImage: UIImage(named: newValue!)!)
        }
    }
    
    func setImageUrl(url: NSURL, placeholderImage: UIImage?, optionsInfo: KingfisherOptionsInfo?, roundImage: Bool) {
        self.kf_setImageWithURL(url,
                                placeholderImage: placeholderImage,
                                optionsInfo: optionsInfo,
                                progressBlock: nil,
                                completionHandler: { (image, error, cacheType, imageURL) -> () in
                                    if roundImage {
                                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                                            let roundedImage = image?.roundedImageWithSize(self.frame.size)
                                            dispatch_async(dispatch_get_main_queue(), {
                                                self.image = roundedImage
                                            })
                                        })
                                    }
                                    else {
                                        self.image = image
                                    }
        })
    }
}
