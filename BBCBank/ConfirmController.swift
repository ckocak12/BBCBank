//
//  ConfirmController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 16/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit
import Firebase

class ConfirmController: UIViewController {
    
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var userNameField: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if FIRApp.defaultApp() == nil {
            FIRApp.configure()
        }
        userNameField.text = Transaction.sharedTrans.userNameSurname
        amount.text = String(Transaction.sharedTrans.amount) + " $"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmClicked(_ sender: UIButton) {
        let amount = Transaction.sharedTrans.amount
        let toWhom = Transaction.sharedTrans.customerNo
        
        makeTransfer(to: toWhom, amount: amount)
    }
    
    func makeTransfer(to: String, amount: Double) {
        
        let from = User.sharedUser.userName
        var balance = 0.0
        
        print("towhom: "+to)
        print("from: "+from)
        
        let ref = FIRDatabase.database().reference().child("users")
        
        let ref1 = ref.child(to)
        let ref2 = ref.child(from)
        
        ref1.observeSingleEvent(of: .value, with: { (snapshot) in
            balance = (snapshot.value as? NSDictionary)?["balance"] as? Double ?? 0.0
            print("balance: "+String(balance))
            let newBalance = balance + amount
            print("new balance: "+String(newBalance))
            
            ref1.child("balance").setValue(newBalance)
        })
        
        ref2.observeSingleEvent(of: .value, with: { (snapshot) in
            balance = (snapshot.value as? NSDictionary)?["balance"] as? Double ?? 0.0
            print("balance: "+String(balance))
            let newBalance = balance - amount
            print("new balance: "+String(newBalance))
            
            ref2.child("balance").setValue(newBalance)
            User.sharedUser.balance = newBalance
            
            let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "success") as! SuccessController
            self.present(nextPage, animated: true)
        })
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "remittancePage") as! RemittanceController
        self.present(nextPage, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
