//
//  Expense.swift
//  Splitty
//
//  Created by Nicholas Brinkel on 6/24/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import Foundation

struct Expense: Equatable, Hashable {
    
    enum ExpenseType {
        case meal
        case groceries
        case rent
        case bill
        case excursion
        case shopping
        
        static func getRandomExpense() -> ExpenseType {
            let types: [ExpenseType] = [.meal, .groceries, .rent, .bill, .excursion, .shopping]
            let randomInt = Int(arc4random_uniform(UInt32(types.count)))
            
            return types[randomInt]
        }
    }
    
    var name: String
    var type: ExpenseType
    var peoplePaying: [Person : Double]
    var totalValue: Double
    var hashValue: Int
    
    init() {
        let names = ["Dinner", "Electric", "Boat Rental", "Groceries", "Wine Glasses"]
        
        let randomInt = Int(arc4random_uniform(UInt32(names.count)))
        
        self.name = names[randomInt]
        self.type = ExpenseType.getRandomExpense()
        self.peoplePaying = [:]
        
        for _ in 1...4 {
            let randomAmount = Double(arc4random_uniform(UInt32(60)))
            self.peoplePaying[Person()] = randomAmount
        }
        
        
        
        self.hashValue = Int(arc4random())
        self.totalValue = Double(arc4random_uniform(UInt32(250)))
    }
    
    mutating func add(person: Person, paying amount: Double) {
        peoplePaying[person] = amount
    }
    
    func getAmountFor(person: Person) -> Double? {
        return peoplePaying[person]
    }
}
