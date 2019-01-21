//
//  CSManager.swift
//  CSNetwork
//
//  Created by Chrystian (Pessoal) on 20/01/2019.
//

import Foundation

public enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

open class CSManager {
    
    public init () {
    }
    
    public func request<T: Encodable>(_ request: T, host: String, route: String, httpMethod: RequestType, responseHandler: @escaping (Data) -> Void) {
        
        // Prepare url.
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = route
        
        if let url = urlComponents.url {
            var requestURL = URLRequest(url: url)
            requestURL.httpMethod = httpMethod.rawValue
            
            // Prepare params.
            do {
                let jsonData = try JSONEncoder().encode(request)
                
                // Prepare header.
                var headers = requestURL.allHTTPHeaderFields ?? [:]
                headers["Content-Type"] = "application/json"
                requestURL.allHTTPHeaderFields = headers
                
                if httpMethod == .post {
                    requestURL.httpBody = jsonData
                } else if httpMethod == .get {
                    urlComponents.queryItems = try request.toURLQueryItem()
                }
                
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: requestURL) { (data, urlResponse, taskError) in
                    DispatchQueue.main.async {
                        
                        if let _error = taskError {
                            print(_error.localizedDescription)
                        } else if let responseData = data {
                            responseHandler(responseData)
                        }
                    }
                }
                task.resume()
            } catch {
                fatalError("Could not request.")
            }
        }
        else {
            fatalError("Could not create URL from components")
        }
    }
}
