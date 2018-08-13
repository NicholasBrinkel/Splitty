//
//  GroupsViewController.swift
//  Splitty
//
//  Created by Nicholas Brinkel on 6/8/18.
//  Copyright © 2018 Nicholas Brinkel. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let cellId = String(describing: GroupsCell.self)
    var groupStore = GroupStore()
    
    @IBAction func addGroup(_ sender: UIBarButtonItem) {
        groupStore.addGroup()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension GroupsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupStore.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! GroupsCell
        
        let group = groupStore.groups[indexPath.row]
        
        cell.configure(group: group)
        
        return cell
    }
}

extension GroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

class GroupsCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    func configure(group: Group) {
        name.text = group.name
        picture.image = group.picture
    }
}
