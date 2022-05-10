//
//  UserService.swift
//  TwitterTutorial
//
//  Created by Justin Viasus on 5/9/22.
//

import Foundation
import FirebaseAuth

struct UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // You can use observeSingleEventOfType to get the data from the local disk cache immediately. This is useful for data that only needs to be loaded once and isn't expected to change frequently or require active listening.
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
