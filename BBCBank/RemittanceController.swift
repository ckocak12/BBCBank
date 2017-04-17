//
//  RemittanceController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 16/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit

class RemittanceController: UIViewController {

    //MARK: outlets
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    let theUser = User.sharedUser
    let transaction = Transaction.sharedTrans
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueClicked(_ sender: UIButton) {
        Transaction.sharedTrans.userName = userNameField.text!
        Transaction.sharedTrans.amount = Double(amountField.text!)!
        let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "confirmPage") as! ConfirmController
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
