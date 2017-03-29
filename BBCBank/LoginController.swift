//
//  LoginController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 17/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController, UIApplicationDelegate  {
    
    var storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    
    let theUser = User.sharedUser
    
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
        
        print(name)
        print(password)
        
        FIRAuth.auth()?.signIn(withEmail: name, password: password) { (user, error) in
            if self.theUser.mobilePIN == -1 {
            if error == nil {
                self.theUser.userName = self.userNameField.text
             self.userNameField.text = ""
                self.passwordField.text = ""
                let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "mainPage") as! MainPageController
                self.dismiss(animated: false, completion: nil)
                self.dismiss(animated: false, completion: nil)
                self.present(nextPage, animated: true)
            }
            else {
                if self.userNameField.text == "" || self.passwordField.text == "" {
                    self.ErrorLabel.text = "Lütfen bilgileri eksiksiz giriniz."
                }
                else {
                    self.ErrorLabel.text = "Kullanıcı adınızı ya da şifrenizi hatalı girdiniz."
                }
            }
        }
            else {
                if self.userNameField.text == self.theUser.userName && self.passwordField.text == String(self.theUser.mobilePIN) {
                    let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "mainPage") as! MainPageController
                    self.dismiss(animated: false, completion: nil)
                    self.dismiss(animated: false, completion: nil)
                    self.present(nextPage, animated: true)
                }
                else {
                    if self.userNameField.text == "" || self.passwordField.text == "" {
                        self.ErrorLabel.text = "Lütfen bilgileri eksiksiz giriniz."
                    }
                    else {
                        self.ErrorLabel.text = "Kullanıcı adınızı ya da şifrenizi hatalı girdiniz."
                    }

                }
            }
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
        FIRApp.configure()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.dataLabel!.text = dataObject
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
