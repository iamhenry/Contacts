//
//  ContactListController.swift
//  Contacts
//
//  Created by  Henry Moran on 12/27/17.
//  Copyright © 2017 Henry Moran. All rights reserved.
//

import UIKit

extension Contact {
    var firstLetterForSort: String {
        return String(firstName.characters.first!).uppercased()
    }
}

extension ContactsSource {
    static var sortedUniqueFirstLetters: [String] {
        let firstLetters = contacts.map { $0.firstLetterForSort }
        let uniqueFirstLetters = Set(firstLetters)
        return Array(uniqueFirstLetters).sorted()
    }
    
    static var sectionedContacts: [[Contact]] {
        return sortedUniqueFirstLetters.map { firstLetter in
            let filteredContacts = contacts.filter { $0.firstLetterForSort == firstLetter }
            return filteredContacts.sorted(by: {$0.firstName < $1.firstName})
        }
    }
}

class ContactListController: UITableViewController {
    
    var contacts = ContactsSource.contacts

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.firstName
        cell.detailTextLabel?.text = contact.lastName
        cell.imageView?.image = contact.image
        
        
        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContact" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let contact = contacts[indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController, let contactDetailController = navigationController.topViewController as? ContactDetailController else { return }
                
                contactDetailController.contact = contact
            }
        }
    }



}
