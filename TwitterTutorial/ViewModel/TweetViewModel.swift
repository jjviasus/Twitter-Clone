//
//  TweetViewModel.swift
//  TwitterTutorial
//
//  Created by Justin Viasus on 5/11/22.
//

import UIKit

struct TweetViewModel {
    
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: URL? {
        return self.user.profileImageUrl
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: self.tweet.timestamp, to: now) ?? "2m"
    }
    
    var userInfoText: NSAttributedString {
        // Mutable because we append to it
        let title = NSMutableAttributedString(string: self.user.fullname, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        // Not Mutable because we don't append to it
        title.append(NSAttributedString(string: " @\(self.user.username)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        title.append(NSAttributedString(string: "・\(self.timestamp)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return title
    }
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
