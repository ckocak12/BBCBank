//
//  ContactFinder.swift
//  BBCBank
//
//  Created by Cansu Koçak on 08/05/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Intents

class Contact: NSObject {
    
    public let nameSurname: String
    public let userName: String
    
    public init(nameSurname: String, userName: String) {
        self.nameSurname = nameSurname
        self.userName = userName
    }

    static func allContacts() -> [Contact] {
        var contacts = [Contact]()
    
        contacts.append(Contact.init(nameSurname: "Berika", userName: "bsoyoz"))
        contacts.append(Contact.init(nameSurname: "Cansu", userName: "ckocak"))
        contacts.append(Contact.init(nameSurname: "Bihter", userName: "byalta"))
        
        return contacts as [Contact]
    }
    
}
