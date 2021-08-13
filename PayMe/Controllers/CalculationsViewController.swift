//
//  CalculationsViewController.swift
//  PayMe
//
//  Created by Justin Hua on 2021-08-12.
//  Copyright © 2021 Justin Hua. All rights reserved.
//

import Foundation
import UIKit

class CalculationsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CalculationList.sharedInstance.calculations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = CalculationList.sharedInstance.calculations[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCalculation = CalculationList.sharedInstance.calculations[indexPath.row]

        if let viewController = storyboard?.instantiateViewController(identifier: "CalculationViewController") as? CalculationViewController {
            viewController.calculation = selectedCalculation
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
