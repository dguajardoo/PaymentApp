//
//  CreditCardViewController.swift
//  PaymentApp
//
//  Created by David Guajardo Osorio on 12/10/18.
//  Copyright © 2018 David Guajardo Osorio. All rights reserved.
//

import UIKit

class CreditCardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableCreditCard: UITableView!
    
    var monto: String? = ""
    
    var arr = ["dfsd","sdfsdf", "sdfsdfsdf", "s"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableCreditCard.delegate = self
        self.tableCreditCard.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arr.count
        
    }
    
    
    
    // create a cell for each table view row
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        // create a new cell if needed or reuse an old one
        
        let cell:UITableViewCell = self.tableCreditCard.dequeueReusableCell(withIdentifier: "MyCell") as UITableViewCell!
        
        
        // set the text from the data model
        
        cell.textLabel?.text = self.arr[indexPath.row]
        
        return cell
        
    }
    
    
    
    // method to run when table view cell is tapped
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You tapped cell number \(indexPath.row).")
        
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
