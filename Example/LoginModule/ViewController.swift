//
//  ViewController.swift
//  LoginModule
//
//  Created by brmaciel on 02/10/2021.
//  Copyright (c) 2021 brmaciel. All rights reserved.
//

import UIKit
import LoginModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapLoginViewButton(_ sender: UIButton) {
        let destinationVC = LoginRouter.createModule()
        
        self.present(destinationVC, animated: true, completion: nil)
    }

}

