//
//  YapilacakKayitVC.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import UIKit

class YapilacakKayitVC: UIViewController {

    @IBOutlet weak var tfYapilacakIs: UITextField!
    
    var yapilacakKayitPresenterNesnesi : ViewToPresenterYapilacakKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        YapilacakKayitRouter.createModule(ref: self)
    }
    

    @IBAction func buttonEkle(_ sender: Any) {
        if let yi = tfYapilacakIs.text{
            yapilacakKayitPresenterNesnesi?.ekle(yapilacak_is: yi)
        }
    }
    

}
