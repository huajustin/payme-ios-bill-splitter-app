//
//  Contact.swift
//  PayMe
//
//  Created by Justin Hua on 2021-08-12.
//  Copyright © 2021 Justin Hua. All rights reserved.
//

import Foundation

class Contact {
    var name: String
    var email: String
    var paid: Bool
    
    init(name: String, email: String, paid: Bool? = false) {
        self.name = name
        self.email = email
        
        if paid != nil {
            self.paid = paid!
        } else {
            self.paid = false
        }
    }
    
    func setToPaid() {
        self.paid = true
    }
    
    func setToUnpaid() {
        self.paid = false
    }
}
