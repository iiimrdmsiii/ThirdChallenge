//
//  MoviePhotoController.swift
//  ThirdChallenge
//
//  Created by Dallin Smuin on 5/20/19.
//  Copyright © 2019 Dallin Smuin. All rights reserved.
//

import Foundation

class MoviePhotoController {
    func fetchMoviePhotoInfo(completion: @escaping (MovieItems?) -> Void) {
        let baseURL = URL(string: "https://m.media-amazon.com/images/")!
        
        let query: [String: String] = [
            "api_key": "DEMO_Key",
        ]
        
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let movieInfo = try?
                    jsonDecoder.decode(MovieItems.self, from: data) {
                completion(movieInfo)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}
