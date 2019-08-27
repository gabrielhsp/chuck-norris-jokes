//
//  JokesCategoryViewController.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 22/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

class JokesCategoryViewController: UIViewController {
    static let sceneIdentifier = "Categories"
    
    override func loadView() {
        view = JokesCategoriesList(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout(withTitle: JokesCategoryViewController.sceneIdentifier)
        
        
    }
}

extension JokesCategoryViewController: JokesCategoriesListDelegate {
    func userSelectedItem(withCategory category: String) {
        print("selectedCategory", category)
    }
}
