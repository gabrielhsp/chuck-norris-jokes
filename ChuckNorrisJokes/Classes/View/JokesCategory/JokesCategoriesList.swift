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
    static let heightForRow = CGFloat(80)
    static let cellIdentifier = "cell"
    
    weak var delegate: JokesCategoriesListDelegate?
    
    init(delegate: JokesCategoriesListDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
        setupTableView()
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

// MARK: - ViewCode Protocol
extension JokesCategoriesList: ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
    }
    
    func setupComponents() {
        addSubview(jokesCategoriesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            jokesCategoriesTableView.topAnchor.constraint(equalTo: topAnchor),
            jokesCategoriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            jokesCategoriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            jokesCategoriesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UITableView Delegate and DataSource
extension JokesCategoriesList: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        jokesCategoriesTableView.delegate = self
        jokesCategoriesTableView.dataSource = self
        jokesCategoriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: JokesCategoriesList.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return JokesCategoriesList.heightForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JokesCategoriesList.cellIdentifier, for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "App Category"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.userSelectedItem(withCategory: "")
    }
}
