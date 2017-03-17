//
//  MobilePINController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 17/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit

class MobilePINController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var PINButton: UIButton!
    
    //MARK: Actions
    
    @IBAction func GetPINClicked(_ sender: UIButton) {
        //RANDOM GENERATOR HERE
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
