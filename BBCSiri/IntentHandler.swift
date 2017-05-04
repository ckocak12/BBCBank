//
//  IntentHandler.swift
//  SiriExt
//
//  Created by Cansu Koçak on 12/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import Intents



// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"


class IntentHandler: INExtension {
    
    
    override func handler(for intent: INIntent) -> Any? {
        if intent is INSendPaymentIntent {
            return SendPaymentIntentHandler()
        }
        return nil
    }   
}
