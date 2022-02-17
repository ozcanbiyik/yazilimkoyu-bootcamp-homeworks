//
//  YapilacakDetayVC.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import UIKit

class YapilacakDetayVC: UIViewController {

    var yapilacak : Yapilacak?
    
    var yapilacakDetayPresenterNesnesi : ViewToPresenterYapilacakDetayProtocol?
    
    @IBOutlet weak var tfYapilacakIs: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yapilacak{
            tfYapilacakIs.text = y.yapilacak_is
        }
     
        YapilacakDetayRouter.createModule(ref: self)
        
    }
    @IBAction func buttonGuncelle(_ sender: Any) {
        
        if let yi = tfYapilacakIs.text, let y = yapilacak{
            yapilacakDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: yi)
        }
        
    }
    
}
