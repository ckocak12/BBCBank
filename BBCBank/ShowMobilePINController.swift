//
//  ShowMobilePINController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 29/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit

class ShowMobilePINController: UIViewController {
    
    let theUser = User.sharedUser
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    
    //MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mobilePINLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        mobilePINLabel.text = String(theUser.mobilePIN)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "loginPage")
            self.present(nextPage, animated: true)
        })
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
