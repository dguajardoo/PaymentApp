//
//  ViewController.swift
//  PaymentApp
//
//  Created by David Guajardo Osorio on 12/10/18.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtMonto: UITextField!
    @IBOutlet weak var btnIngresar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnIngresar(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if txtMonto.text == "" {
            let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            if segue.identifier == "SegueCreditCard" {
                
                let secController = segue.destination as! CreditCardViewController
                secController.monto = txtMonto.text
                
            }
        }
    }
    
}

