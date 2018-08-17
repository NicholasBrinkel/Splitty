//
//  UserProfileViewController.swift
//  Splitty
//
//  Created by Apple User on 8/16/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import Foundation
import UIKit

class UserProfileViewController: UIViewController {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var person: Person!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        User.init(person: Person(firstName: "Nicholas", lastName: "Brinkel", picture: nil))
    }
    
    func configure(person: Person?) {
        if let person = person {
            self.firstName.text = person.firstName
            self.lastName.text = person.lastName
            self.picture.image = person.picture
        } else {
            let user = User.person
            self.firstName.text = User.person.firstName
            self.lastName.text = User.person.lastName
            self.picture.image = User.person.picture
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(person: nil)
    }
}
