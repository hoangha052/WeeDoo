//
//  UITableViewExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 7/23/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

extension UITableView {
    func insertLastRowInSection(section: Int, animation: UITableViewRowAnimation) {
        let lastIndexInSection = self.numberOfRowsInSection(section)
        self.insertRowsAtIndexPaths([NSIndexPath(forRow: lastIndexInSection, inSection: section)], withRowAnimation:animation)
    }
    
    func scrollToLastRow() {
        let lastSectionIndex = self.numberOfSections - 1
        let lastRowIndex = self.numberOfRowsInSection(lastSectionIndex) - 1
        self.scrollToRowAtIndexPath(NSIndexPath(forRow: lastRowIndex, inSection: lastSectionIndex), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
    }
    
    func addEmptyImageView() {
        let emptyView: UIView = UIView.init(frame: self.frame)
        emptyView.backgroundColor = UIColor(rgba: AppColors.sentOfferCellBackground)
        let imageView: UIImageView = UIImageView.init(image: UIImage.init(named: "logo_grey"))
        emptyView.addSubview(imageView)
        
//        imageView.snp.makeConstraints { (make) in
//            make.height.width.equalTo(112)
//            make.centerX.equalTo(emptyView)
//            make.centerY.equalTo(emptyView)
//        }
        
        self.backgroundView = emptyView
    }

}