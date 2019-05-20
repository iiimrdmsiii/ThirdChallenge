//
//  MovieController.swift
//  ThirdChallenge
//
//  Created by Dallin Smuin on 5/20/19.
//  Copyright © 2019 Dallin Smuin. All rights reserved.
//

import Foundation
import UIKit

class MovieController {

    func fetchItems(matching query: [String: String], completion: @escaping ([MovieItem]?) -> Void) {
        
        let baseURL = URL(string: "http://www.omdbapi.com/?t=")!
        
        guard let url = baseURL.withQueries(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data,
                let movieItems = try?
                    decoder.decode(MovieItems.self, from: data) {
                completion(movieItems.results)
            } else {
                print("Either no data was returned, or data was not serialized.")
                
                completion(nil)
                return
            }
        }
        task.resume()
    }
}
