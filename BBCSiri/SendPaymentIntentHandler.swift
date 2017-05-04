//
//  SendPaymentIntentHandler.swift
//  BBCBank
//
//  Created by Cansu Koçak on 04/05/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Intents

class SendPaymentIntentHandler: NSObject, INSendPaymentIntentHandling {
    // MARK: - INSendPaymentIntentHandling
    
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
     /*   let payee = intent.payee
        let amount = intent.currencyAmount
        if payee != nil && amount != nil {
            let activity = NSUserActivity(activityType: "Payment")
            activity.title = "Pay"
            activity.userInfo = ["payee": intent.payee ?? "", "amount": intent.currencyAmount ?? 0]
            activity.becomeCurrent()
        }

        
        print("Sending \(String(describing: amount)) payment to \(String(describing: payee))!")
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))*/
        
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    }
    
    
    
    
}
