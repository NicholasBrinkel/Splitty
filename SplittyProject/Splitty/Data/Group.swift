//
//  Group.swift
//  Splitty
//
//  Created by Nicholas Brinkel on 6/24/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import Foundation
import UIKit

struct Group: Equatable, Hashable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name && lhs.expenses == rhs.expenses && lhs.members == rhs.members
    }
    
    var name: String
    var members: [Person]
    var expenses: [Expense]
    var picture: UIImage?
    var hashValue: Int

    
    init() {
        let names = ["Friends", "Family", "Boyz", "Co-workers"]
        let randomInt = Int(arc4random_uniform(UInt32(names.count)))

        self.members = []
        for _ in 0...randomInt {
            let person = Person()
            members.append(person)
        }
        self.name = names[randomInt]
        
        self.expenses = []
        for _ in 0...4 {
            let expense = Expense()
            expenses.append(expense)
        }
        self.hashValue = Int(arc4random())
    }
    
    init(groupName name: String, members: [Person], expenses: [Expense], picture: UIImage) {
        self.expenses = expenses
        self.name = name
        self.members = members
        self.picture = picture
        self.hashValue = Int(arc4random())
    }
    
    // Returns if member was successfully added to the group
    mutating func add(member: Person) -> Bool {
        if !members.filter({ $0 == member }).isEmpty {
            self.members.append(member)
            return true
        }
        return false
    }
    
    mutating func remove(member: Person) {
        let index = members.index(of: member)
        
        if let index = index {
            self.members.remove(at: index)
        }
    }
    
    func getAmountFor(person: Person, expense: Expense) -> Double? {
        return expense.getAmountFor(person: person)
    }
}
