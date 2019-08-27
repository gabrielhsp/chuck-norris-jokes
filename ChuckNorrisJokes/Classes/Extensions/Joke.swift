//
//  Joke.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 26/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import Foundation

struct Joke: Codable {
    var id: String?
    var categories: [String]?
    var creationDate: String?
    var updateDate: String?
    var icon: String?
    var externalUrl: String?
    var description: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case categories
        case creationDate = "created_at"
        case updateDate = "updated_at"
        case icon = "icon_url"
        case externalUrl = "url"
        case description = "value"
    }
}
