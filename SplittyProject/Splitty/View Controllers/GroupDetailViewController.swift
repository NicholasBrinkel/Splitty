//
//  GroupDetailViewController.swift
//  Splitty
//
//  Created by Nicholas Brinkel on 7/1/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import Foundation
import UIKit

class GroupDetailViewController: UIViewController {
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupProfilePicture: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private var group: Group!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func configure(group: Group) {
        self.group = group
        
    }
    
    override func viewDidLoad() {
        tableView.dataSource = self
        //tableView.delegate = self
        
        if let picture = group.picture {
            self.groupProfilePicture.image = picture
        }
        groupNameLabel.text = group.name
    }
}

extension GroupDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ExpenseCell.self)) as! ExpenseCell
        
        cell.configure(expense: group.expenses[indexPath.row])
        
        return cell
    }
}

class ExpenseCell: UITableViewCell {
    @IBOutlet weak var expenseName: UILabel!
    @IBOutlet weak var amountOwed: UILabel!
    
    func configure(expense: Expense) {
        
        self.expenseName.text = expense.name
        if let owed = User.debts[expense] {
            self.amountOwed.text = "$\(owed)"
        }
    }
}

















