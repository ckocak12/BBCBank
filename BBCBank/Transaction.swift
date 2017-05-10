//
//  Transaction.swift
//  BBCBank
//
//  Created by Cansu Koçak on 16/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Foundation

class Transaction {

    static let sharedTrans = Transaction()

    var accountNo = ""
    var customerNo = ""
    var userNameSurname = ""
    var amount = 0.0
    private init() {
    }
}


