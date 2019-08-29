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
            label.text = "Creation Date: "
            label.textAlignment = .center
            label.textColor = .gray
        
        return label
    }()
    
    private lazy var textViewJokeDescription: UITextView = {
        let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.isScrollEnabled = false
            textView.font = UIFont.systemFont(ofSize: 16)
            textView.textAlignment = .center
            textView.textColor = .black
            textView.text = "Description of the joke goes right here my friend with a lot of more text that you can even imagine in your life"
        
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
            imageViewJoke.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewJoke.heightAnchor.constraint(equalToConstant: 48),
            imageViewJoke.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            labelCreationDate.topAnchor.constraint(equalTo: imageViewJoke.bottomAnchor, constant: 16),
            labelCreationDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelCreationDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            textViewJokeDescription.topAnchor.constraint(equalTo: labelCreationDate.bottomAnchor, constant: 8),
            textViewJokeDescription.leadingAnchor.constraint(equalTo: labelCreationDate.leadingAnchor),
            textViewJokeDescription.trailingAnchor.constraint(equalTo: labelCreationDate.trailingAnchor)
        ])
    }
}
