//
//  FriendManager.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import Foundation
import SwiftUI

actor FriendManager {
    static let shared = FriendManager()
    let imagePath = "MyApp_Friend_Image"
    
    var friendsList = [Friend]()
    
    func createDirectory(_ directoryName: String) -> String? {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(directoryName).path else {
            print("Error to getting Path.")
            return nil
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error to create directory. Error: \(error).")
            }
        }
        
        return path
    }
    
    func getPath(directoryName: String, fileName: String) -> URL? {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(createDirectory(directoryName)!).appendingPathComponent(fileName) else {
            print("Error to getting Path.")
            return nil
        }
        return path
    }
    
    func saveImage(image: UIImage, name: String) {
        guard let data = image.jpegData(compressionQuality: 0.5), let path = getPath(directoryName: imagePath, fileName: "\(name).jpeg") else {
            print("Error to getting Image.")
            return
        }
        
        do{
            try data.write(to: path)
        } catch let error {
            print("Error to save image to File Manager. Error: \(error)")
        }
    }
    
    func saveData() {
        
    }
    
    func getImage(name: String) -> UIImage? {
        guard let path = getPath(directoryName: imagePath, fileName: name)?.path, FileManager.default.fileExists(atPath: path) else {
            print("Error to getting Image from File Manager.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
}
