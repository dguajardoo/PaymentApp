//
//  Installment.swift
//  PaymentApp
//
//  Created by David Guajardo Osorio on 12/19/18.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit

class Installment: NSObject {

    let recommended_message: String?
    
    init?(dictionary: NSDictionary?) {
        if (dictionary == nil) {
            return nil
        }
        
        self.recommended_message = dictionary?["recommended_message"] as? String
        
    }
    
}
