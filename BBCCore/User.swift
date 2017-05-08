//
//  User.swift
//  BBCBank
//
//  Created by Cansu Koçak on 29/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Foundation

class User {
    
    static let sharedUser = User()
    var userName = ""
    var mobilePIN = -1
    var userNameSurname = ""
    var balance = 0.0
    var customerNo = 0
    
    private init() {
    }
    
    
    
}
