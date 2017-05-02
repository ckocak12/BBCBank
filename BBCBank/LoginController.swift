//
//  LoginController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 17/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit
import Firebase
import Intents

class LoginController: UIViewController, UIApplicationDelegate  {
    
    //MARK: Global Variables
    
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    var databaseRef: FIRDatabaseReference!
    
    //MARK: Outlets
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var mobilePINButton: UIButton!
    @IBOutlet weak var favTransButton: UIButton!
    @IBOutlet weak var ATMLocatorButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    //MARK: Actions
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        let name = userNameField.text! + "@bbc.com"
        let password = passwordField.text!
        
        FIRAuth.auth()?.signIn(withEmail: name, password: password) { (user, error) in
//            if User.sharedUser.mobilePIN == -1 {
            if error == nil {
                //MARK: Creating User from database
                self.databaseRef = FIRDatabase.database().reference()
                self.databaseRef.child("users").child(self.userNameField.text!).observeSingleEvent(of: .value, with: { (snapshot) in
                    User.sharedUser.userName = self.userNameField.text!
                    User.sharedUser.customerNo = (snapshot.value as? NSDictionary)?["customer_no"] as? Int ?? 0
                    User.sharedUser.balance = (snapshot.value as? NSDictionary)?["balance"] as? Double ?? 0
                    User.sharedUser.userNameSurname = (snapshot.value as? NSDictionary)?["name_surname"] as? String ?? ""
                    
                    //MARK: Sending to next page
                    let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "mainPage") as! MainPageController
                    self.present(nextPage, animated: true)
                })
            }
            else { //MARK: Error conditions
                if self.userNameField.text == "" || self.passwordField.text == "" {
                    self.ErrorLabel.text = "Lütfen bilgileri eksiksiz giriniz."
                }
                else {
                    self.ErrorLabel.text = "Kullanıcı adınızı ya da şifrenizi hatalı girdiniz."
                }
            }
//        }
 /*           else {
                if self.userNameField.text == User.sharedUser.userName && self.passwordField.text == String(User.sharedUser.mobilePIN) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "mainPage") as! MainPageController
                    self.present(nextPage, animated: true)
                    }) 
                }
                else {
                    if self.userNameField.text == "" || self.passwordField.text == "" {
                        self.ErrorLabel.text = "Lütfen bilgileri eksiksiz giriniz."
                    }
                    else {
                        self.ErrorLabel.text = "Kullanıcı adınızı ya da şifrenizi hatalı girdiniz."
                    }

                }
            }*/
        }
    }
        
    
    @IBAction func mobilePINClicked(_ sender: UIButton) {
//        mobile pin action will be implemented,
    }
    
    @IBAction func favTransClicked(_ sender: UIButton) {
//        fav transactions will be shown
    }
    
    @IBAction func ATMLocatorClicked(_ sender: UIButton) {
//        nearest ATM will be shown
    }

    //MARK: Page Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        if FIRApp.defaultApp() == nil {
            FIRApp.configure()
        }
        // Ask for Siri permission
        INPreferences.requestSiriAuthorization {
            authorizationStatus in
            switch authorizationStatus {
            case .authorized:
                print("Authorized")
            default:
                print("Not Authorized")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
