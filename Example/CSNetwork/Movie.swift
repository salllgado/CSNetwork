//
//  Movie.swift
//  CSNetwork_Example
//
//  Created by Chrystian (Pessoal) on 26/01/2019.
//  Copyright © 2019 CSProductions. All rights reserved.
//

import Foundation

struct Movie {
    
    let name: String
    let year: Int
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case year
        case author
    }
}

extension Movie: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        year = try values.decode(String.self, forKey: .year).toInt()!
        author = try values.decode(String.self, forKey: .author)
    }
}
