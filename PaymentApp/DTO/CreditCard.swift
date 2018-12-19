//
//  CreditCard.swift
//  PaymentApp
//
//  Created by Josue Hernandez Gonzalez on 19/12/2018.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit

class CreditCard: NSObject {
    
    let creditId: String?
    let name: String?
    let payment: String?
    let image: String?
    
    init?(dictionary: NSDictionary?) {
        if (dictionary == nil) {
            return nil
        }
        
        self.creditId = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.payment = dictionary["payment"] as? String
        self.image = dictionary["image"] as? String
        
    }
}
