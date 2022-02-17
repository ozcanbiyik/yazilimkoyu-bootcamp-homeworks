//
//  YapilacakKayitInteractor.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

class YapilacakKayitInteractor : PresenterToInteractorYapilacakKayitProtocol{
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacak.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func yapilacakEkle(yapilacak_is: String) {
        
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO yapilacak (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
