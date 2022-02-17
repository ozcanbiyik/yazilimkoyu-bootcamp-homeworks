//
//  ViewControllerX.swift
//  Homework004
//
//  Created by Ozcan Biyik on 16.12.2021.
//

import UIKit

class ViewControllerX: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "pathY", sender: nil)
    }
    
}
