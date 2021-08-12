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
}

class Calculations {
    var calculations: Array<Calculation>
    
    // Singleton instance
    static let sharedInstance = Calculations(calculations: [])
    
    init(calculations: [Calculation]) {
        self.calculations = calculations
    }
    
    static func getCalculations() -> Array<Calculation> {
        return sharedInstance.calculations;
    }
    
    static func addCalculation(calculation: Calculation) {
        sharedInstance.calculations.append(calculation)
    }
}
