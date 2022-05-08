//
//  ExploreController.swift
//  TwitterTutorial
//
//  Created by Justin Viasus on 5/6/22.
//

import UIKit

class ExploreController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Explore"
    }
}

