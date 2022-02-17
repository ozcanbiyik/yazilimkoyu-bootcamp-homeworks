//
//  ViewController.swift
//  Homework005
//
//  Created by Ozcan Biyik on 21.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sayiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var ilkIslem = true
    var operation = "+"
    func sayiDegerGonder(sayi : String){
        var yazdirSayi = String(sayiLabel.text!)
        if ilkIslem{
            yazdirSayi = ""
            ilkIslem = false
        }
        yazdirSayi += sayi
        sayiLabel.text = yazdirSayi
    }
    
    
    @IBAction func degerTiklandi(_ sender: UIButton) {
        sayiDegerGonder(sayi: sender.currentTitle!)
        print("\(sender.currentTitle!)")
    }
    
    var sayi1 : Double?
    var op = "+"
    @IBAction func mantikOperatorleri(_ sender: UIButton) {
        op = sender.currentTitle!
        
        if op == "AC" {
            sayiLabel.text = "0"
            ilkIslem = true
        }
        
        sayi1 = Double(sayiLabel.text!)
        ilkIslem = true
    }
    @IBAction func esittirButtonTiklandi(_ sender: Any) {
        let sayi2 = Double(sayiLabel.text!)
        var sonuc : Double?
        sonuc = sayi1! + Double(sayi2!)
        sayiLabel.text = String(sonuc!)
        ilkIslem = true
    }
}

