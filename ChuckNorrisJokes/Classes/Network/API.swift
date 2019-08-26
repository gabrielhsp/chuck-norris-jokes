//
//  API.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 26/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import Foundation
import Alamofire

final class API {
    static let categoriesEndpoint = "https://api.chucknorris.io/jokes/categories"
    static let jokeDetailEndpoint = "https://api.chucknorris.io/jokes/random?category="
    
    class func requestCategories(responseRequest: @escaping(([JokeCategory]) -> Void)) {
        Alamofire.request(API.categoriesEndpoint).responseJSON { response in
            switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                    
                    do {
                        let response = try JSONDecoder().decode([JokeCategory].self, from: data)
                        
                        responseRequest(response)
                    } catch (let error) {
                        print(error)
                    }
                
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    class func requestJoke(usingCategory category: String, responseRequest: @escaping((Joke) -> Void )) {
        Alamofire.request("\(API.jokeDetailEndpoint)\(category)").responseJSON { response in
            switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                
                    do {
                        let response = try JSONDecoder().decode(Joke.self, from: data)
                        
                        responseRequest(response)
                    } catch (let error) {
                        print(error)
                    }
                
                case .failure(let error):
                    print(error)
            }
        }
    }
}
