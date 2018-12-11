//
//  BankViewController.swift
//  PaymentApp
//
//  Created by David Guajardo Osorio on 12/11/18.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var monto: String? = ""
    var creditCard: String? = ""
    var arrayBank: [JSON] = []
    var auxCreditCard: String? = ""
    
    
    @IBOutlet weak var lblMonto: UILabel!
    @IBOutlet weak var tableViewBank: UITableView!
    @IBOutlet weak var lblCreditCard: UILabel!
    @IBOutlet weak var lblBank: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableViewBank.delegate = self
        self.tableViewBank.dataSource = self
        
        self.lblMonto.text = monto
        self.lblCreditCard.text = creditCard
        print("holasdsadasd ", monto)
        print("holasdsadasd \(self.creditCard)")
        print("holasdsadasd \(self.auxCreditCard)")
        
        self.CallAPI()
    }
    

    func CallAPI() {
        let url: String? = "https://api.mercadopago.com/v1/payment_methods/card_issuers?public_key=444a9ef5-8a6b-429f-abdf-587639155d88&payment_method_id="
        let param = self.auxCreditCard
        let full = "\(url)\(param)"
        
        print(full)
        
    
        Alamofire.request(full).responseJSON { response in
            if let result = response.result.value {
                //print("JSON: \(result)")
                let json = JSON(result)
                for item in json.arrayValue {
                    print("item: \(item)")
                    let id = item["id"].stringValue
                    let name = item["name"].stringValue
                    let processing_mode = item["processing_mode"].stringValue
                    let imagen = item["thumbnail"].stringValue
                    
                    
                    let data = JSON(["id":id,"name":name,"processing_mode":processing_mode, "imagen": imagen])
                    
                    self.arrayBank.append(data)
                    
                }
                self.tableViewBank.reloadData()
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayBank.count
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableViewBank.dequeueReusableCell(withIdentifier: "CellBank") as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.arrayBank[indexPath.row]["name"].stringValue
        return cell
        
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You tapped cell number \(indexPath.row).")
        self.lblBank.text = self.arrayBank[indexPath.row]["name"].stringValue
    }

}
