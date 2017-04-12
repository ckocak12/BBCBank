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
    //MARK: Page Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    
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
            
            do {
                let fileName = "/Users/cansukocak/Documents/Projects/XCode Projects/BBCBank/userData.txt"
                let writeData = /*theUser.userName + "-" + */passwordField.text!
                try writeData.write(toFile: fileName, atomically: true, encoding: String.Encoding.utf8)
            }
                catch _ as NSError {
                print("Failed saving data")
                }
            }
        
        let nextPage = storyBoardRef.instantiateViewController(withIdentifier: "success")
        present(nextPage, animated: true)
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
