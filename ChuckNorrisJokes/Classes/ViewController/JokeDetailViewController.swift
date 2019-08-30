//
//  JokeDetailViewController.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 27/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {
    var selectedCategory: String
    
    init(selectedCategory: String) {
        self.selectedCategory = selectedCategory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = JokeDetail(delegate: self, jokeCategory: selectedCategory)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        title = selectedCategory.capitalized
        view.backgroundColor = .white
    }
}

extension JokeDetailViewController: JokeDetailDelegate {
    func jokeHasBeenLoaded() {
        print("Hi")
    }
}
