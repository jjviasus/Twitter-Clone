//
//  AuthService.swift
//  TwitterTutorial
//
//  Created by Justin Viasus on 5/9/22.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    // Let's us create an instance of AuthService once instead of multiple times
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullname
        let username = credentials.username
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        // A unique identifier for the profile image file
        let filename = NSUUID().uuidString
        let storageReference = STORAGE_PROFILE_IMAGES.child(filename)
        
        // Puts the file in the firebase storage
        storageReference.putData(imageData, metadata: nil) { meta, error in
            storageReference.downloadURL { url, error in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                // Create the user in the firebase authentication
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: Error is \(error.localizedDescription)")
                        return
                    }
                    
                    // A unique identifier for the user
                    guard let uid = result?.user.uid else { return }
                    
                    let values = ["email": email,
                                  "username": username,
                                  "fullname": fullname,
                                  "profileImageUrl": profileImageUrl]
                    
                    // Update the valuesi in the firebase database
                    let userReference = REF_USERS.child(uid)
                    userReference.updateChildValues(values, withCompletionBlock: completion)
                }
            }
        }
    }
}
