//
//  MobilePINRegisterController.swift
//  Pods
//
//  Created by Cansu Koçak on 28/03/2017.
//
//

import UIKit
import Firebase

class MobilePINRegisterController: UIViewController, UIApplicationDelegate {
    
    let theUser = User.sharedUser
    var storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    let firebaseAuth = FIRAuth.auth()
    
    //MARK: Outlets
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    //MARK: Page Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recogizeOutFocus()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func backClicked(_ sender: UIButton) {
        let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "mainPage") as! MainPageController
        self.present(nextPage, animated: true)
    }
    
    @IBAction func logoutclicked(_ sender: UIButton) {
        
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    @IBAction func doneClicked(_ sender: UIButton) {
        if self.passwordField.text != self.rePasswordField.text {
            self.errorLabel.text = "Şifreler eşleşmiyor. Lütfen tekrar deneyiniz."
        }
        else {
                UserDefaults.standard.set(passwordField.text, forKey: "BBCPass")
                UserDefaults.standard.synchronize()
        }
        
        let nextPage = storyBoardRef.instantiateViewController(withIdentifier: "success")
        present(nextPage, animated: true)
    }
    
    func recogizeOutFocus() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MobilePINRegisterController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
