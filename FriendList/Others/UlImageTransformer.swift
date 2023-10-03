//
//  UlImageTransformer.swift
//  FriendList
//
//  Created by Isaque da Silva on 01/10/23.
//

import Foundation
import UIKit

class UlImageTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
            return data
        } catch let error {
            print("Error to archiver data. Error: \(error)")
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return image
        } catch let error {
            print("Error to unarchiver image. Error: \(error)")
            return nil
        }
    }
}
