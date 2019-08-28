//
//  JokeDetail.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 28/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

protocol JokeDetailDelegate: class {
    func jokeHasBeenLoaded()
}

class JokeDetail: UIView {
    weak var delegate: JokeDetailDelegate?
//    var jokeViewModel: JokeViewModel
    
    init(delegate: JokeDetailDelegate /*, jokeViewModel: JokeViewModel */) {
        self.delegate = delegate
//        self.jokeViewModel = jokeViewModel
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageViewJoke: UIImageView = {
        let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 12
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.layer.borderWidth = 0.5
        
        return imageView
    }()
    
    private lazy var labelCreationDate: UILabel = {
        let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
        
        return label
    }()
    
    private lazy var textViewJokeDescription: UITextView = {
        let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.isScrollEnabled = false
            textView.font = UIFont.systemFont(ofSize: 16)
            textView.textColor = .black
        
        return textView
    }()
}

extension JokeDetail: ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
    }
    
    func setupComponents() {
        addSubview(imageViewJoke)
        addSubview(labelCreationDate)
        addSubview(textViewJokeDescription)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewJoke.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageViewJoke.heightAnchor.constraint(equalToConstant: 48),
            imageViewJoke.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
}