//
//  AuthenticationManager.swift
//  FriendList
//
//  Created by Isaque da Silva on 02/10/23.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated = false
    
    let context = LAContext()
    
    var typeOfBiometry: String {
        var type = ""
        if context.biometryType == .touchID {
            type = "Touch ID"
        } else if context.biometryType == .faceID {
            type = "Face ID"
        }
        
        return type
    }
    
    func authenticate() {
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Use Touch ID to unlock and secure your friends list"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { succsess, error in
                if succsess {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                }
                
                if (error != nil) {
                    print("Error to unlock App. Error: \(String(describing: error?.localizedDescription))")
                }
            }
        }
    }
    
    init() {
        self.authenticate()
    }
}
