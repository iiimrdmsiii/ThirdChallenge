//
//  MovieItems.swift
//  ThirdChallenge
//
//  Created by Dallin Smuin on 5/19/19.
//  Copyright © 2019 Dallin Smuin. All rights reserved.
//

import Foundation

struct MovieItems: Codable {
    let results: [MovieItem]
}

struct MovieItem: Codable {

    var title: String
    var year: String
    var rated: String
    var plot: String?
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case plot = "Plot"
        case imageURL = "Poster"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try value.decode(String.self, forKey: CodingKeys.title)
        year = try value.decode(String.self, forKey: CodingKeys.year)
        rated = try value.decode(String.self, forKey: CodingKeys.rated)
        plot = try value.decode(String.self, forKey: CodingKeys.plot)
        imageURL = try value.decode(URL.self, forKey: CodingKeys.imageURL)
        
    }
}
