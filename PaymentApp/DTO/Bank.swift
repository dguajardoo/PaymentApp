//
//  Bank.swift
//  PaymentApp
//
//  Created by David Guajardo Osorio on 12/19/18.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit

class Bank: NSObject {

    let id: String?
    let name: String?
    let processing_mode: String?
    let image: String?
    
    init?(dictionary: NSDictionary?) {
        if (dictionary == nil) {
            return nil
        }
        
        self.id = dictionary?["id"] as? String
        self.name = dictionary?["name"] as? String
        self.processing_mode = dictionary?["processing_mode"] as? String
        self.image = dictionary?["thumbnail"] as? String
        
    }
    
}
