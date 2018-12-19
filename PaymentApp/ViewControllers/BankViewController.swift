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
    var auxBank: String? = ""
    
    var BanksArray = [Bank]()
    
    @IBOutlet weak var btnSeguir: UIButton!
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
       
        self.Call()
    }
    

    /*
    func CallAPI() {
        
        let parametros: Parameters = ["public_key": "444a9ef5-8a6b-429f-abdf-587639155d88", "payment_method_id":self.auxCreditCard!]
        
        let url: String? = "https://api.mercadopago.com/v1/payment_methods/card_issuers"
        
        Alamofire.request(url!, method: .get, parameters: parametros).responseJSON { response in
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
 */
    
    func Call()
    {
        PaymentAppSerives.CallAPIBank(id: self.auxCreditCard!){(bank) in
            if let bank = bank {
                self.BanksArray = bank
                self.tableViewBank.reloadData()
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("qwertuiop", self.BanksArray.count)
        return self.BanksArray.count
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableViewBank.dequeueReusableCell(withIdentifier: "CellBank") as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.BanksArray[indexPath.row].name
        return cell
        
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You tapped cell number \(indexPath.row).")
        self.lblBank.text = self.BanksArray[indexPath.row].name
        self.auxBank = self.BanksArray[indexPath.row].id
    }
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        let cc = lblBank.text
        if (cc?.trimmingCharacters(in: NSCharacterSet.whitespaces).isEmpty)! {
            let alert = UIAlertController(title: "Alerta", message: "Seleccione un banco.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            if segue.identifier == "SegueInstallments" {
                
                let secController = segue.destination as! InstallmentsViewController
                secController.monto = lblMonto.text
                secController.creditCard = lblCreditCard.text
                secController.auxCreditCard = auxCreditCard
                secController.bank = lblBank.text
                secController.auxBank = auxBank
                
                
            }
        }
        
     }

}
