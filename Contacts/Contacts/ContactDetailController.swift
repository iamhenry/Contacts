//
//  ContactDetailController.swift
//  Contacts
//
//  Created by  Henry Moran on 12/27/17.
//  Copyright © 2017 Henry Moran. All rights reserved.
//

import UIKit

class ContactDetailController: UITableViewController {

    var contact: Contact?
    
    // Outlets
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureView() {
        guard let contact = contact else { return }
        
        phoneNumberLabel.text = contact.phone
        emailLabel.text = contact.email
        streetLabel.text = contact.street
        cityLabel.text = contact.city
        stateLabel.text = contact.state
        zipCodeLabel.text = contact.zip
    }
}
