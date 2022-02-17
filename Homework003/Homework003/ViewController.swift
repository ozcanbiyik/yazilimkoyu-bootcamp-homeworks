//
//  ViewController.swift
//  Homework003
//
//  Created by Ozcan Biyik on 16.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Space Cowboy"
        
        let appearanceNC = UINavigationBarAppearance()
        appearanceNC.backgroundColor = UIColor(named: "textColor")
        appearanceNC.titleTextAttributes = [.foregroundColor : UIColor(named: "mainColor")!, NSAttributedString.Key.font : UIFont(name: "StardosStencil-Regular", size: 22)!]
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearanceNC
        navigationController?.navigationBar.compactAppearance = appearanceNC
        navigationController?.navigationBar.scrollEdgeAppearance = appearanceNC
        
    }


}

