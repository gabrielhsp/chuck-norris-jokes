//
//  JokesCategoriesList.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 23/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

protocol JokesCategoriesListDelegate: class {
    func userSelectedItem(withCategory category: String)
}

class JokesCategoriesList: UIView {
    weak var delegate: JokesCategoriesListDelegate?
    
    init(delegate: JokesCategoriesListDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var jokesCategoriesTableView: UITableView = {
        let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.removeSpacing()
        
        return tableView
    }()
}

extension JokesCategoriesList: ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
    }
    
    func setupComponents() {
        addSubview(jokesCategoriesTableView)
    }
    
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                jokesCategoriesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                jokesCategoriesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                jokesCategoriesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                jokesCategoriesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                jokesCategoriesTableView.topAnchor.constraint(equalTo: topAnchor),
                jokesCategoriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                jokesCategoriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                jokesCategoriesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
}
