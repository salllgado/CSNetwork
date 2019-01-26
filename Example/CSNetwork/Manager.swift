//
//  Manager.swift
//  CSNetwork_Example
//
//  Created by Chrystian (Pessoal) on 20/01/2019.
//  Copyright © 2019 CSProductions. All rights reserved.
//

import Foundation
import CSNetwork

extension CSManager {
    
    func requestStatements(_ params: BasicRequest, responseHandler: @escaping (Movie) -> Void) {
        request(params, host: baseUrl, route: Endpoint.personagens.rawValue, httpMethod: .get) { (jsonData) in
            do {
                let objResponse = try JSONDecoder().decode(Movie.self, from: jsonData)
            } catch {
                fatalError("Error while parsing data")
            }
        }
    }
}
