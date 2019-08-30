//
//  JokeDetail.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 28/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit
import SDWebImage

protocol JokeDetailDelegate: class {
    func jokeHasBeenLoaded()
}

class JokeDetail: UIView {
    weak var delegate: JokeDetailDelegate?
    var jokeCategory: String
    
    init(delegate: JokeDetailDelegate, jokeCategory: String) {
        self.delegate = delegate
        self.jokeCategory = jokeCategory
        super.init(frame: .zero)
        setup()
        fetchDataOnComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageViewJoke: UIImageView = {
        let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private lazy var textViewJokeDescription: UITextView = {
        let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.isScrollEnabled = false
            textView.font = UIFont.systemFont(ofSize: 16)
            textView.textAlignment = .center
            textView.textColor = .black
        
        return textView
    }()
    
    private func fetchDataOnComponents() {
        API.requestJoke(usingCategory: jokeCategory) { joke in
            let jokeParsed = JokeViewModel(joke: joke)
            
            DispatchQueue.main.async {
                self.renderData(withJokeViewModel: jokeParsed)
            }
        }
    }
    
    private func renderData(withJokeViewModel viewModel: JokeViewModel) {
        imageViewJoke.sd_setImage(with: viewModel.icon)
        textViewJokeDescription.text = viewModel.description
    }
}

extension JokeDetail: ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
    }
    
    func setupComponents() {
        addSubview(imageViewJoke)
        addSubview(textViewJokeDescription)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewJoke.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageViewJoke.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewJoke.heightAnchor.constraint(equalToConstant: 48),
            imageViewJoke.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            textViewJokeDescription.topAnchor.constraint(equalTo: imageViewJoke.bottomAnchor, constant: 8),
            textViewJokeDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textViewJokeDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
