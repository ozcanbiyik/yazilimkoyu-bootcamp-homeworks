//
//  YapilacakDetayInteractor.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

class YapilacakDetayInteractor : PresenterToInteractorYapilacakDetayProtocol{
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacak.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func yapilacakGuncelle(yapilacak_id: Int, yapilacak_is: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE yapilacak SET yapilacak_is = ? WHERE yapilacak_id = ?", values: [yapilacak_is,yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
