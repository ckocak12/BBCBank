//
//  DataViewController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 15/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit
import Firebase

class DataViewController: UIViewController, UIApplicationDelegate{
    
    
    

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FIRApp.configure()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.dataLabel!.text = dataObject
    }
    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBOutlet weak var UserNameTextField: UITextField!
    
    @IBOutlet weak var PasswordLabel: UILabel!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func LoginButton(_ sender: UIButton) {
//        TODO: Implement
      /**  let database = FIRDatabase.database().reference(fromURL:"https://bbcbank-b976a.firebaseio.com/")
        let name = database.child ("Login").observe(<#T##eventType: FIRDataEventType##FIRDataEventType#>, andPreviousSiblingKeyWith: <#T##(FIRDataSnapshot, String?) -> Void#>)
        let password = database.child ("Login").value(forKey: UserNameTextField.text!)
        if (name == UserNameTextField.text! && password == PasswordTextField.text!) {
        }**/
        
        let name = UserNameTextField.text! + "@bbc.com"
        let password = PasswordTextField.text!
        
        print(name)
        print(password)
        
        FIRAuth.auth()?.signIn(withEmail: name, password: password) { (user, error) in
    
        print(error)
        print (user?.displayName) // firebase isim tutmadığı için bu null dönüyo
        print(user?.email)
        
        }
        
    }
    
    @IBAction func ATMLocateButton(_ sender: UIButton) {
//        TODO: Implement
    }
    @IBAction func MobilePINButton(_ sender: UIButton) {
//        TODO: Implement
    }
    
    @IBAction func FavTransButton(_ sender: UIButton) {
//        TODO: Implement
    }
    


}

