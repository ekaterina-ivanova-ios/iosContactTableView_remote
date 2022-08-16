//
//  ContactsViewController.swift
//  iosContactTableView
//
//  Created by Екатерина Иванова on 16.08.2022.
//

import Foundation
import UIKit

class ContactsViewController: UIViewController {
    
    //create array with contacts
    private let contacts = ContactAPI.getContacts()
    //create table
    let contactsTableView = UITableView()
    
    //setting view
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contactsTableView)
        
        //setting table
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
    }
}
 

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        
        return cell
    }
    
        
}
