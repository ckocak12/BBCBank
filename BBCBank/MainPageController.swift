//
//  MainPageController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 17/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit
import Firebase

class MainPageController: UIViewController {
    
    let theUser = User.sharedUser
    let firebaseAuth = FIRAuth.auth()
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    
    //MARK: Outlets
    
    @IBOutlet weak var UserNameSurname: UILabel!
    @IBOutlet weak var userBalance: UILabel!
    @IBOutlet weak var customerNo: UILabel!
    @IBOutlet weak var logOut: UIButton!
    
    
    @IBAction func logOutButton(_ sender: UIButton) {
        do {
            try firebaseAuth?.signOut()
            //MARK: - Send to login page
            let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "loginPage") as! LoginController
            self.present(nextPage, animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    

    //MARK: Page Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        UserNameSurname.text = self.theUser.userNameSurname
        userBalance.text = String(describing: self.theUser.balance) + " $"
        customerNo.text = String(self.theUser.customerNo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
