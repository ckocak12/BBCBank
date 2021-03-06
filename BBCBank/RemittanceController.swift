//
//  RemittanceController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 16/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit
import Firebase

class RemittanceController: UIViewController {

    //MARK: outlets
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    let theUser = User.sharedUser
    let transaction = Transaction.sharedTrans
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    var usersDatabaseRef: FIRDatabaseReference!
    var accountsDatabaseRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueClicked(_ sender: UIButton) {
        let amount = Double(amountField.text!)
        
        
        if userNameField.text! == "" || amountField.text! == "" {
            errorLabel.text = "Lütfen bilgileri eksiksiz giriniz."
        }
        else if amount!>User.sharedUser.balance{
            errorLabel.text = "Bu tutar gönderebileceğiniz miktarın üzerinde."
        }
        else {

            Transaction.sharedTrans.accountNo = self.userNameField.text!
            Transaction.sharedTrans.amount = Double(self.amountField.text!)!
            
            self.accountsDatabaseRef = FIRDatabase.database().reference().child("accounts")
            self.accountsDatabaseRef.observeSingleEvent(of: .value, with: { (snapshot) in
                Transaction.sharedTrans.customerNo = String(describing: (snapshot.value as? NSDictionary)?[Transaction.sharedTrans.accountNo] as? Int ?? -1)
                
                if Transaction.sharedTrans.customerNo == "-1" {
                    self.errorLabel.text = "Bu hesap bulunamadı."
                }
                else {
                    self.usersDatabaseRef = FIRDatabase.database().reference().child("users")
                    self.usersDatabaseRef.child(Transaction.sharedTrans.customerNo).observeSingleEvent(of: .value, with: { (snapshot) in
                        Transaction.sharedTrans.userNameSurname = (snapshot.value as? NSDictionary)?["name_surname"] as? String ?? ""
                        
                        //MARK: Sending to next page
                        let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "confirmPage") as! ConfirmController
                        self.present(nextPage, animated: true)
                    })
                }

                })

        }
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "mainPage") as! MainPageController
        self.present(nextPage, animated: true)
    }
    
    
 /*   override func restoreUserActivityState(_ activity: NSUserActivity) {
        let payee = activity.userInfo?["payee"] as! String
        let amount = activity.userInfo?["content"] as! Double
        
        
        
    }*/
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
