//
//  CalculationViewController.swift
//  PayMe
//
//  Created by Justin Hua on 2021-08-13.
//  Copyright © 2021 Justin Hua. All rights reserved.
//

import Foundation
import UIKit

class CalculationViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var remainingPrice: UILabel!
    
    var calculation: Calculation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = calculation!.title
        totalPrice.text = String(format: "$%.2f", calculation!.price)
        remainingPrice.text = String(format: "Remaining: $%.2f", calculation!.getRemainingPrice())

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "userCellIdentifier")
        tableView!.alwaysBounceVertical = false;
        // display an empty view in the footer
        tableView.tableFooterView = UIView()
    }
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculation!.contacts.count
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCellIdentifier", for: indexPath)
        let contact = calculation!.contacts[indexPath.row]

        // Configure the cell’s contents.
        cell.textLabel!.text = contact.name
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(contact.paid, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
        cell.accessoryView = switchView
           
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func switchDidChange(_ sender: UISwitch) {
        if sender.isOn {
            calculation!.contacts[sender.tag].setToPaid()
        } else {
            calculation!.contacts[sender.tag].setToUnpaid()
        }
        
        remainingPrice.text = String(format: "Remaining: $%.2f", calculation!.getRemainingPrice())
    }
}
