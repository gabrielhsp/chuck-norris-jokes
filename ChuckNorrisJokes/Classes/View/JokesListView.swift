//
//  JokesListView.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 23/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

protocol JokesCategoriesListDelegate: class {
    func userSelectedItem() -> String
}

class JokesCategoriesList: UIView {
    weak var delegate: JokesCategoriesListDelegate?
    
    init(delegate: JokesCategoriesListDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var jokesCategoriesTableView: UITableView = {
        let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
}
