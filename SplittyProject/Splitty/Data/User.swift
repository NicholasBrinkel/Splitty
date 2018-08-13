//
//  User.swift
//  Splitty
//
//  Created by Nicholas Brinkel on 7/2/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import Foundation
import UIKit

struct User {
    static var person: Person {
        get {
            return self.person
        }
        set {
            
        }
    }
    static var groups: [Group] {
        get {
            
        }
        set {
            
        }
    }
    static var debts: [Expense:Double] {
        get {
            
        }
        set {
            
        }
    }
    
    init(person: Person, inGroups groups: [Group]) {
        self.person = person
        self.groups = groups
        
        
    }
    
    func updateCostsOwed() {
        for group in groups {
            
        }
    }
    
    func addTo(expense: Expense, paying amount: Double) {
        debts[expense] = amount
    }
}
