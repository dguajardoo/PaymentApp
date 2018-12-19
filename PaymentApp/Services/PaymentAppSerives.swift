//
//  PaymentAppSerives.swift
//  PaymentApp
//
//  Created by Josue Hernandez Gonzalez on 19/12/2018.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PaymentAppSerives: NSObject {
    
    class func CallAPI(completion: ([CreditCard]?)) {
        Alamofire.request("https://api.mercadopago.com/v1/payment_methods?public_key=444a9ef5-8a6b-429f-abdf-587639155d88", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            var tmp: NSMutableArray = []
            
            switch response.result {
            case .failure( _):
                if let data = response.data {
                    print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                }
                //When I get any error return nil
                completion(nil)
                
            case .success(let value):
                let json = JSON(value)
                for current in json.arrayValue {
                    tmp.add(CreditCard(dictionary: current.dictionaryObject! as NSDictionary)!)
                }
                
                //Return all Rates from WwebServices
                completion(tmp as NSArray as? [CreditCard])
                
            }
        }
    }
    
}
