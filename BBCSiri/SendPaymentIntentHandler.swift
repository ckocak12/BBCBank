//
//  SendPaymentIntentHandler.swift
//  BBCBank
//
//  Created by Cansu Koçak on 04/05/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Intents
import Firebase

class SendPaymentIntentHandler: NSObject, INSendPaymentIntentHandling {
    // MARK: - INSendPaymentIntentHandling
    
    let paymentThreshold = 50.0
    
    
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        if FIRApp.defaultApp() == nil {
            FIRApp.configure()
        }
        
        let payee = intent.payee
        let contacts = Contact.allContacts()
        var theContact = Contact.init(nameSurname: "", userName: "")
        var userFound = false
        
        for c in contacts {
            if c.nameSurname == payee?.displayName {
                theContact = c
                userFound = true
            }
        }
        
        print(userFound)
        if !userFound {
             completion(INSendPaymentIntentResponse.init(code: .failureRequiringAppLaunch, userActivity: nil))
        }
            
        else {
            let to = theContact.userName
           // let from = UserDefaults.standard.string(forKey: "theUserName")
            let from = "ckocak"
            let amount = intent.currencyAmount?.amount as! Double
            print(from)
            if amount <= paymentThreshold {
            makeTransfer(to: to, from: from, amount: amount)
            completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
            }
            else {
                completion(INSendPaymentIntentResponse.init(code: .failurePaymentsAmountAboveMaximum, userActivity: nil))
            }
        }
        
    }

    func makeTransfer(to: String, from: String, amount: Double) {
        var balance = 0.0
        
        let ref = FIRDatabase.database().reference().child("users")
        let ref1 = ref.child(to)
        let ref2 = ref.child(from)
        
        ref1.observeSingleEvent(of: .value, with: { (snapshot) in
            balance = (snapshot.value as? NSDictionary)?["balance"] as? Double ?? 0.0
            print("to's balance: "+String(balance))
            let newBalance = balance + amount
            print("to's new balance: "+String(newBalance))
            
            ref1.child("balance").setValue(newBalance)
        })
        
        ref2.observeSingleEvent(of: .value, with: { (snapshot) in
            balance = (snapshot.value as? NSDictionary)?["balance"] as? Double ?? 0.0
            print("from's balance: "+String(balance))
            let newBalance = balance - amount
            print("from's new balance: "+String(newBalance))
            
            ref2.child("balance").setValue(newBalance)
            
        })
    }

}
