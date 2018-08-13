//
//  Person.swift
//  Splitty
//
//  Created by Nicholas Brinkel on 6/24/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import Foundation
import UIKit

struct Person: Equatable, Hashable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.inGroups == rhs.inGroups
    }
    
    var firstName: String
    var lastName: String
    var picture: UIImage?
    var inGroups: [Group]
    var hashValue: Int
    
    init() {
        let firstNames = ["Tom", "Lisa", "Jake", "Dylan", "Lucas", "Maya"]
        let lastNames = ["Jones", "Yang", "Cooper", "Lol", "Hoffsteader", "Lmao"]
        
        let randomInt1 = arc4random_uniform(UInt32(firstNames.count))
        let randomInt2 = arc4random_uniform(UInt32(lastNames.count))
        
        self.firstName = firstNames[Int(randomInt1)]
        self.lastName = lastNames[Int(randomInt2)]
        self.inGroups = []
        self.hashValue = Int(arc4random())
    }
    
    init(firstName: String, lastName: String, picture: UIImage?) {
        self.firstName = firstName
        self.lastName = lastName
        self.picture = picture
        self.inGroups = []
        self.hashValue = Int(arc4random())
    }
    
    mutating func addTo(group: inout Group) {
        if group.add(member: self) {
            inGroups.append(group)
        }
    }
    
    mutating func set(profilePicture picture: UIImage?) {
        if let picture = picture {
            self.picture = picture
        }
    }
}
