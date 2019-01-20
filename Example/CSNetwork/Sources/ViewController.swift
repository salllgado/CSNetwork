//
//  ViewController.swift
//  CSNetwork
//
//  Created by salllgado@hotmail.com.br on 01/20/2019.
//  Copyright (c) 2019 salllgado@hotmail.com.br. All rights reserved.
//

import UIKit
import CSNetwork

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionRequest(action: Any) {
        let params = BasicRequest(apikey: "1e2c15eb35da31cfc4aa9d270ccfdb4c", name: "Hulk")
        let manager = CSManager()
        manager.requestStatements(params) { (charResponse) in
            let charResponse = charResponse
            print(charResponse)
        }
    }
}

