//
//  CSNetwork_ExampleTests.swift
//  CSNetwork_ExampleTests
//
//  Created by Chrystian (Pessoal) on 26/01/2019.
//  Copyright © 2019 CSProductions. All rights reserved.
//

import XCTest
@testable import CSNetwork_Example
@testable import CSNetwork

class CSNetwork_ExampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let objResponse = BasicRequest(apikey: "111", name: "AAA")
        
        do {
            
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}
