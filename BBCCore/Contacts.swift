//
//  Contacts.swift
//  BBCBank
//
//  Created by Cansu Koçak on 05/05/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Foundation
import Intents

public class Contact {
    public let nameSurname: String
    public let userName: String
    
    public init(nameSurname: String, userName: String) {
        self.nameSurname = nameSurname
        self.userName = userName
    }
    
    public func inPerson() -> INPerson {
        let nameFormatter = PersonNameComponentsFormatter()
        
        if let nameComponents = nameFormatter.personNameComponents(from: nameSurname) {
            return INPerson(handle: userName, nameComponents: nameComponents, contactIdentifier: nil)
        }
        else {
            return INPerson(handle: userName, displayName: nameSurname, contactIdentifier: nil)
        }
    }
    
    public func allContacts() -> [Contact] {
        var contacts = [Contact]()
        
        contacts.append(Contact(nameSurname: "Berika Soyöz", userName: "bsoyoz"))
        contacts.append(Contact(nameSurname: "Cansu Koçak", userName: "ckocak"))
        contacts.append(Contact(nameSurname: "Bihter Yalta", userName: "byalta"))
        return contacts
    }
    
}
