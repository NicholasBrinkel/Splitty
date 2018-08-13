//
//  File.swift
//  Splitty
//
//  Created by Nicholas Brinkel on 6/24/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import Foundation

class GroupStore {
    var groups: [Group] = []
    
    
    init() {
        for _ in 1...4 {
            groups.append(Group())
        }
    }
    
    func addGroup() {
        let group = Group()
        let alreadyExists = !groups.filter({ $0 == group }).isEmpty
        
       // if !alreadyExists {
            groups.append(group)
        //}
    }
    
    
    func add(group: Group) {
        let alreadyExists =
            !groups.filter({ $0 == group }).isEmpty
        
        if !alreadyExists {
            groups.append(group)
        }
    }
    
    
    // returns true if successfully removed, and false otherwise
    func remove(group: Group) {
        groups = groups.filter({ (group) -> Bool in
            group != group
        })
    }
}
