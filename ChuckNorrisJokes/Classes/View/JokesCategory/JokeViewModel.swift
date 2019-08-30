//
//  JokeViewModel.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 28/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import Foundation

final class JokeViewModel {
    var joke: Joke
    
    init(joke: Joke) {
        self.joke = joke
    }
    
    var icon: URL {
        let url = URL(string: String())
        
        guard let icon = joke.icon, let iconPath = URL(string: icon) else { return url! }
        
        return iconPath
    }
    
    var description: String {
        guard let description = joke.description else { return String() }
        
        return description
    }
}
