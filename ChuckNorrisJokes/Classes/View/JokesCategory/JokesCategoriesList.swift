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
    var categories: [String] = []
    
    init(delegate: JokesCategoriesListDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
        setupTableView()
        fetchCategories()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchCategories() {
        API.requestCategories { categories in
            self.categories = categories
            
            DispatchQueue.main.async {
                self.jokesCategoriesTableView.reloadData()
            }
        }
    }
    
    private lazy var jokesCategoriesTableView: UITableView = {
        let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorColor = .clear
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
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return JokesCategoriesList.heightForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JokesCategoriesList.cellIdentifier, for: indexPath)
        let cellData = categories[indexPath.row]
        
        cell.setupLayout(borderWidth: 0.5, borderColor: UIColor(white: 0.1, alpha: 0.1).cgColor, usingIndicator: .disclosureIndicator)
        cell.textLabel?.text = cellData.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.userSelectedItem(withCategory: categories[indexPath.row])
    }
}
