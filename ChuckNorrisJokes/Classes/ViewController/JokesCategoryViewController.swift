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
        super.loadView()
        view = JokesCategoriesList(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout(withTitle: JokesCategoryViewController.sceneIdentifier)
        setupBackButton()
    }
}

extension JokesCategoryViewController: JokesCategoriesListDelegate {
    func userSelectedItem(withCategory category: String) {
        navigationController?.pushViewController(JokeDetailViewController(selectedCategory: category), animated: true)
    }
}
