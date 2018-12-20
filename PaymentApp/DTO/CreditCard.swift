//
//  CreditCard.swift
//  PaymentApp
//
<<<<<<< HEAD
//  Created by David Guajardo Osorio on 12/19/18.
=======
//  Created by Josue Hernandez Gonzalez on 19/12/2018.
>>>>>>> 2dcdc16d2e0e8f466e85d34072a2c967fbbac1d3
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit

class CreditCard: NSObject {
    
<<<<<<< HEAD
    let id: String?		
=======
    let creditId: String?
>>>>>>> 2dcdc16d2e0e8f466e85d34072a2c967fbbac1d3
    let name: String?
    let payment: String?
    let image: String?
    
    init?(dictionary: NSDictionary?) {
        if (dictionary == nil) {
            return nil
        }
        
<<<<<<< HEAD
        self.id = dictionary?["id"] as? String
        self.name = dictionary?["name"] as? String
        self.payment = dictionary?["payment_type_id"] as? String
        self.image = dictionary?["thumbnail"] as? String
=======
        self.creditId = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.payment = dictionary["payment"] as? String
        self.image = dictionary["image"] as? String
>>>>>>> 2dcdc16d2e0e8f466e85d34072a2c967fbbac1d3
        
    }
}
