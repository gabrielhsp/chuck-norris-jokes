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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = selectedCategory.capitalized
        
        API.requestJoke(usingCategory: selectedCategory) { response in
            print("response", response)
        }
    }
}
