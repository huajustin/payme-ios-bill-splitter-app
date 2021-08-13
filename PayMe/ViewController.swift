//
//  ViewController.swift
//  PayMe
//
//  Created by Justin Hua on 2021-08-12.
//  Copyright © 2021 Justin Hua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Example bills
        let contactOne = Contact(name: "Kanye West", email: "fake@test.com")
        let contactTwo = Contact(name: "Bob Marley", email: "fake2@test.com")
        let contactThree = Contact(name: "Bill Gates", email: "fake3@test.com")
        
        let calculationOne = Calculation(title: "McDonald's", price: 46.25, contacts: [contactOne, contactTwo, contactThree])
        let calculationTwo = Calculation(title: "Olive Garden", price: 126.97, contacts: [contactOne, contactTwo, contactThree])
        let calculationThree = Calculation(title: "Bowling", price: 60.42, contacts: [contactOne, contactTwo, contactThree])

        CalculationList.sharedInstance.addCalculation(calculation: calculationOne)
        CalculationList.sharedInstance.addCalculation(calculation: calculationTwo)
        CalculationList.sharedInstance.addCalculation(calculation: calculationThree)
    }


}

