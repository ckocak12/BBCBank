//
//  ContactFinder.swift
//  BBCBank
//
//  Created by Cansu Koçak on 08/05/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Intents

class Contact: NSObject {
    
    public let name: String
    public let customerNo: String
    public let accountNum: String
    
    public init(name: String, customerNo: String, accountNum: String) {
        self.name = name
        self.customerNo = customerNo
        self.accountNum = accountNum
    }

    static func allContacts() -> [Contact] {
        var contacts = [Contact]()
    
        contacts.append(Contact.init(name: "Berika", customerNo: "543543", accountNum: "654345632"))
        contacts.append(Contact.init(name: "Cansu", customerNo: "456789", accountNum: "123456789"))
        contacts.append(Contact.init(name: "Bihter", customerNo: "567982", accountNum: "987656787"))
        
        return contacts as [Contact]
    }
    
}
