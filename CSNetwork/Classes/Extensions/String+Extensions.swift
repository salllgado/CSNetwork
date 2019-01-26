//
//  String+Extensions.swift
//  CSNetwork
//
//  Created by Chrystian (Pessoal) on 26/01/2019.
//

import Foundation

public extension String {
    
    func toInt() -> Int? {
        return Int(self)
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
    func toFloat() -> Float? {
        return Float(self)
    }
    
    func toURL() -> URL? {
        return URL(string: self)
    }
}
