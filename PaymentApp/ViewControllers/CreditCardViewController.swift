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
    
    var CreditCardsArray = [CreditCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lblMonto.text = monto
        
        self.tableCreditCard.delegate = self
        self.tableCreditCard.dataSource = self
        
        //self.CallAPI()
        self.Call()
    }
    
    
    func Call()
    {
        PaymentAppSerives.CallAPICredidCard{(creditCards) in
            if let creditCards = creditCards {
                self.CreditCardsArray = creditCards
                self.tableCreditCard.reloadData()
                
            }
        }
    }
    
    /*
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
 */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.CreditCardsArray.count
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableCreditCard.dequeueReusableCell(withIdentifier: "MyCell") as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.CreditCardsArray[indexPath.row].name
        return cell
        
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You tapped cell number \(indexPath.row).")
        self.lblCreditCard.text = self.CreditCardsArray[indexPath.row].name
        self.auxCreditCard = self.CreditCardsArray[indexPath.row].id
    }
    
    
    @IBAction func btnSeguir(_ sender: Any) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cc = lblCreditCard.text
        if (cc?.trimmingCharacters(in: NSCharacterSet.whitespaces).isEmpty)! {
            let alert = UIAlertController(title: "Alerta", message: "Seleccione una tarjeta de credito.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            if segue.identifier == "SegueBank" {
                
                let secController = segue.destination as! BankViewController
                secController.monto = lblMonto.text
                secController.creditCard = lblCreditCard.text
                secController.auxCreditCard = auxCreditCard
                
            }
        }
    }
}
