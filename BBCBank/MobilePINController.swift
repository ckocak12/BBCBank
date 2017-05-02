//
//  MobilePINController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 17/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit

class MobilePINController: UIViewController {
    
    let theUser = User.sharedUser
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    
    //MARK: Outlets
    
    @IBOutlet weak var allertLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var PINButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    //MARK: Actions
    
    @IBAction func GetPINClicked(_ sender: UIButton) {
        
        do {
            let userPassword = UserDefaults.standard.object(forKey: "BBCPass") as! String
            if passwordField.text! == userPassword as String {
                theUser.mobilePIN = Int(arc4random_uniform(UInt32(99999999)))
                let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "showPIN")
                present(nextPage, animated: true)
                
            }
            else {
                if passwordField.text == "" {
                    errorLabel.text = "Lütfen bilgileri eksiksiz giriniz."
                }
                else {
                    errorLabel.text = "Şifrenizi yanlış girdiniz. Lütfen tekrar deneyiniz."
                }
            }
        }
        catch {
            print("Failed reading data.")
        }
    }
    

    //MARK: Page Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
