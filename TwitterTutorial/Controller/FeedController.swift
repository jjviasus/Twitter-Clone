//
//  FeedController.swift
//  TwitterTutorial
//
//  Created by Justin Viasus on 5/6/22.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            configureLeftBarButton()
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        self.view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func configureLeftBarButton() {
        // Makes sure the user exists, if it doesn't this function stops here.
        guard let user = user else { return }
        
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}
