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
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Swift.Void) {
        if let _ = intent.payee, let _ = intent.currencyAmount {
            // Handle the payment here!
            
            completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
        }
        else {
            completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
        }
    }
}
