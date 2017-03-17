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
    


}

