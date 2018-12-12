//
//  PaymentViewController.swift
//  PaymentApp
//
//  Created by David Guajardo Osorio on 12/11/18.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class InstallmentsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var monto: String? = ""
    var creditCard: String? = ""
    var bank: String? = ""
    var arrayInstallments: [JSON] = []
    var auxCreditCard: String? = ""
    var auxBank: String? = ""
    
    var pickerView = UIPickerView()
    var typeValue = String()
    
    @IBOutlet weak var lblMonto: UILabel!
    @IBOutlet weak var lblCreditCard: UILabel!
    @IBOutlet weak var lblBank: UILabel!
    
    @IBOutlet weak var lblInstallments: UILabel!
    
    @IBOutlet weak var btnInstallments: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblMonto.text = monto
        lblCreditCard.text = creditCard
        lblBank.text = bank
        
        self.CallAPI()
    }
    
   
    @IBAction func btnInstallments(_ sender: Any) {
        let alert = UIAlertController(title: "Car Choices", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        alert.isModalInPopover = true
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            
            print("You selected " + self.typeValue )
            
        }))
        self.present(alert,animated: true, completion: nil )
    }
    
    func CallAPI() {
        
        let parametros: Parameters = ["public_key": "444a9ef5-8a6b-429f-abdf-587639155d88", "payment_method_id":self.auxCreditCard!, "amount": self.monto!, "issuer.id": Int(self.auxBank!)]
        
        let url: String? = "https://api.mercadopago.com/v1/payment_methods/installments"
        
        Alamofire.request(url!, method: .get, parameters: parametros).responseJSON { response in
            if let result = response.result.value {
                //print("JSON: \(result)")
                let json = JSON(result)
                for item in json.arrayValue {
                    for item2 in item["payer_costs"] {
                        var j = item2.1
                        
                        let recommended_message = j["recommended_message"].stringValue
                        print(recommended_message)
                        
                        let data = JSON(["recommended_message":recommended_message])
                    
                        self.arrayInstallments.append(data)
                    }
                }
                //self.tableViewBank.reloadData()
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayInstallments.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayInstallments[row]["recommended_message"].stringValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        lblInstallments.text = arrayInstallments[row]["recommended_message"].stringValue
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
