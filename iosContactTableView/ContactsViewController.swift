//
//  ContactsViewController.swift
//  iosContactTableView
//
//  Created by Екатерина Иванова on 16.08.2022.
//

import UIKit

class ContactsViewController: UIViewController {
    
    //create array with contacts
    private let contacts = ContactAPI.getContacts()
    //create table
    let contactsTableView = UITableView()
    
    //setting view
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(contactsTableView)
        
        //setting table
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        navigationItem.title = "Contacts"
     
        
    }
}
 

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.contact = contacts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
