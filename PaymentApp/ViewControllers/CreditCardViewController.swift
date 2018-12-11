//
//  CreditCardViewController.swift
//  PaymentApp
//
//  Created by David Guajardo Osorio on 12/10/18.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CreditCardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var btnSeguir: UIButton!
    @IBOutlet weak var lblCreditCard: UILabel!
    @IBOutlet weak var lblMonto: UILabel!
    @IBOutlet weak var tableCreditCard: UITableView!
    
    var monto: String? = ""
    var auxCreditCard: String? = ""
    var arr = ["dfsd","sdfsdf", "sdfsdfsdf", "s"]
    var arrayCreditCard: [JSON] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lblMonto.text = monto
        
        self.tableCreditCard.delegate = self
        self.tableCreditCard.dataSource = self
        
        self.CallAPI()
    }
    
    
    
    func CallAPI() {
        Alamofire.request("https://api.mercadopago.com/v1/payment_methods?public_key=444a9ef5-8a6b-429f-abdf-587639155d88").responseJSON { response in
            if let result = response.result.value {
                //print("JSON: \(result)")
                let json = JSON(result)
                for item in json.arrayValue {
                    print("item: \(item)")
                    if item["payment_type_id"].stringValue == "credit_card" {
                        let id = item["id"].stringValue
                        let name = item["name"].stringValue
                        let payment_type_id = item["payment_type_id"].stringValue
                        let imagen = item["thumbnail"].stringValue
                        
                        
                        let data = JSON(["id":id,"name":name,"payment_type_id":payment_type_id, "imagen": imagen])
                    
                        self.arrayCreditCard.append(data)
                    }
                }
                self.tableCreditCard.reloadData()
            }
        }

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayCreditCard.count
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableCreditCard.dequeueReusableCell(withIdentifier: "MyCell") as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.arrayCreditCard[indexPath.row]["name"].stringValue
        return cell
        
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You tapped cell number \(indexPath.row).")
        self.lblCreditCard.text = self.arrayCreditCard[indexPath.row]["name"].stringValue
        self.auxCreditCard = self.arrayCreditCard[indexPath.row]["id"].stringValue
    }
    
    
    @IBAction func btnSeguir(_ sender: Any) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueBank" {
            
            let secController = segue.destination as! BankViewController
            secController.monto = lblMonto.text
            secController.creditCard = lblCreditCard.text
            secController.auxCreditCard = auxCreditCard
            
        }
    }

}
