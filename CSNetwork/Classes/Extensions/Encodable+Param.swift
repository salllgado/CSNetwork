//
//  Encodable+Param.swift
//  CSNetwork
//
//  Created by Chrystian (Pessoal) on 20/01/2019.
//

import Foundation

extension Encodable {
    
    /// Convert Encodable type to urlQueryItems
    public func toURLQueryItem() throws -> [URLQueryItem] {
        var urlQueryItems: [URLQueryItem] = []
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        let json = try JSONSerialization.jsonObject(with: data)
        let dict = json as? [String: String]
        
        if let _dict = dict {
            for iten in _dict {
                urlQueryItems.append(URLQueryItem(name: iten.key, value: iten.value))
            }
        }
        return urlQueryItems
    }
    
    /// Convert Encodable type to jsonData.
    public func toJsonData() throws -> Data {
        let jsonData = try JSONEncoder().encode(self)
        return jsonData
    }
}
