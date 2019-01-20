//
//  ResponseData.swift
//  CSNetwork
//
//  Created by Chrystian (Pessoal) on 20/01/2019.
//

import Foundation

struct ResponseData<T: Decodable>: Decodable {
    let data: T
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode(T.self, forKey: .data)
    }
}
