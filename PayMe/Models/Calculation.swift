//
//  Calculation.swift
//  PayMe
//
//  Created by Justin Hua on 2021-08-12.
//  Copyright © 2021 Justin Hua. All rights reserved.
//

import Foundation

class Calculation {
    var title: String
    var contacts: Array<Contact>
    var price: Double
    
    init(title: String, price: Double, contacts: Array<Contact>) {
        self.title = title
        self.price = price
        self.contacts = contacts
    }
    
    func getSplitPrice() -> Double {
        return price / Double(contacts.count)
    }
    
    func getRemainingPrice() -> Double {
        let contactsPaid: Int = contacts.filter { $0.paid }.count
        
        return price - (Double(contactsPaid) * getSplitPrice())
    }
}

class CalculationList {
    var calculations: Array<Calculation>
    
    // Singleton instance
    static let sharedInstance = CalculationList(calculations: [])
    
    private init(calculations: [Calculation]) {
        self.calculations = calculations
    }
    
    func getCalculations() -> Array<Calculation> {
        return CalculationList.sharedInstance.calculations;
    }
    
    func addCalculation(calculation: Calculation) {
        CalculationList.sharedInstance.calculations.append(calculation)
    }
}
