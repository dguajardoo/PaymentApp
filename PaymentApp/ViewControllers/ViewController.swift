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
        if segue.identifier == "SegueCreditCard" {
            
            let secController = segue.destination as! CreditCardViewController
            secController.monto = txtMonto.text
            
        }
    }
    
}

