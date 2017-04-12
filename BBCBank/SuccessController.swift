//
//  SuccessController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 30/03/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit

class SuccessController: UIViewController {
    
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "mainPage")
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
