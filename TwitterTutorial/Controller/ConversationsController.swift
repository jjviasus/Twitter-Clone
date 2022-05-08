//
//  ConversationsController.swift
//  TwitterTutorial
//
//  Created by Justin Viasus on 5/6/22.
//

import UIKit

class ConversationsController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        self.view.backgroundColor = .white
        
        // the navigation item used to represent the view controller in a parent's navigation bar
        self.navigationItem.title = "Messages"
    }
}
