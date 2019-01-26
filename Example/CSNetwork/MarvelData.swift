//
//  MarvelData.swift
//  CSNetwork_Example
//
//  Created by Chrystian (Pessoal) on 20/01/2019.
//  Copyright © 2019 CSProductions. All rights reserved.
//

import Foundation

struct MarvelData {
    
    let id: Int
    let name: String
    let moveis: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case movies
    }
}

extension MarvelData: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        moveis = try values.decode([Movie].self, forKey: .movies)
    }
}
