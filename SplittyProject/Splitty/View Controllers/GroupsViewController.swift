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
    var groupStore: GroupStore!
    
    @IBAction func addGroup(_ sender: UIBarButtonItem) {
        groupStore.addGroup()
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.groupStore = User.groupStore
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        smoothlyDeselectItems(tableView)
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
        let detailVC = storyboard?.instantiateViewController(withIdentifier: String(describing: GroupDetailViewController.self)) as! GroupDetailViewController
        let cell = tableView.cellForRow(at: indexPath) as! GroupsCell
        
        detailVC.configure(group: cell.group)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

class GroupsCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    var group: Group!
    
    func configure(group: Group) {
        self.group = group
        
        name.text = group.name
        picture.image = group.picture
    }   
}
