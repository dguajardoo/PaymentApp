//
//  PaymentAppSerives.swift
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
import Alamofire
import SwiftyJSON

class PaymentAppSerives: NSObject {
<<<<<<< HEAD

    class func CallAPICredidCard(completion: @escaping (_ creditCard: [CreditCard]?) -> ()) {
=======
    
    class func CallAPI(completion: ([CreditCard]?)) {
>>>>>>> 2dcdc16d2e0e8f466e85d34072a2c967fbbac1d3
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
    
<<<<<<< HEAD
    class func CallAPIBank(id: String, completion: @escaping (_ bank: [Bank]?) -> ()) {
        
        let parametros: Parameters = ["public_key": "444a9ef5-8a6b-429f-abdf-587639155d88", "payment_method_id": id]
        
        let url: String? = "https://api.mercadopago.com/v1/payment_methods/card_issuers"
        
        
        Alamofire.request(url!, method: .get, parameters: parametros, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
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
                print("qqqqq", json)
                for current in json.arrayValue {
                    tmp.add(Bank(dictionary: current.dictionaryObject! as NSDictionary)!)
                }
                
                //Return all Rates from WwebServices
                completion(tmp as NSArray as? [Bank])
                
            }
        }
    }
    
    
    class func CallAPIInstallment(id: String, monto: String, bank: String, completion: @escaping (_ bank: [Installment]?) -> ()) {
        
        //let parametros: Parameters = ["public_key": "444a9ef5-8a6b-429f-abdf-587639155d88", "payment_method_id": id, "amount":monto, "issuer.id": Int(bank)]
        
        //let url: String? = "https://api.mercadopago.com/v1/payment_methods/installments"
        print("cuotas", id)
        print("cuotas", monto)
        print("cuotas", bank)
        let url: String? = "https://api.mercadopago.com/v1/payment_methods/installments?public_key=444a9ef5-8a6b-429f-abdf-587639155d88&payment_method_id="+id+"&amount="+monto+"&issuer.id="+bank
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
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
                print("cuotas", json)
                for current in json.arrayValue {
                    for item in current["payer_costs"].arrayValue {
                        tmp.add(Installment(dictionary: item.dictionaryObject! as NSDictionary)!)
                    }
                }
                
                //Return all Rates from WwebServices
                completion(tmp as NSArray as? [Installment])
                
            }
        }
    }
    
    
=======
>>>>>>> 2dcdc16d2e0e8f466e85d34072a2c967fbbac1d3
}
