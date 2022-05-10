//
//  Constants.swift
//  TwitterTutorial
//
//  Created by Justin Viasus on 5/8/22.
//

import Firebase
import FirebaseStorage

// Global constants (accessible anywhere in the app)

// Firebase: Storage
let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

// Firebase: Realtime Database
let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")


