//
//  Contacts.swift
//  BBCBank
//
//  Created by Cansu Koçak on 05/05/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Foundation

class User {
    
    static let sharedUser = User()
    var userName = ""
    var userNameSurname = ""
    var balance = 0.0
    var customerNo = "null"
    var accountNo = "null"
    var mobilePIN = 0
    
    private init() {
    }
    
    
    
}
