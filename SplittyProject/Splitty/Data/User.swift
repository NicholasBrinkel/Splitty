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
    static var person: Person!
    static var groups: [Group]!
    static var debts: [Expense:Double] = [:]
    static var groupStore: GroupStore!

    init(person: Person) {
        User.person = person
        User.groupStore = GroupStore()
        
        User.groups = User.groupStore.groups
        
        for group in User.groupStore.groups {
            for expense in group.expenses {
                User.debts[expense] = expense.getAmountFor(person: person)
            }
        }
    }

    func updateCostsOwed() {
        for group in User.groups {
            
        }
    }

    func addTo(expense: Expense, paying amount: Double) {
        User.debts[expense] = amount
    }
}
