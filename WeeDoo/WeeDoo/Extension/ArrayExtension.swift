//
//  ArrayExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 6/10/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func removeObject(object: Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
    
    mutating func removeObjectsInArray(array: [Element]) {
        for object in array {
            self.removeObject(object)
        }
    }
}