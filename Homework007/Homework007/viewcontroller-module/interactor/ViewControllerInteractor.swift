//
//  ViewControllerInteractor.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

class ViewControllerInteractor : PresenterToInteractorViewControllerProtocol{
    
    var viewControllerPresenter: InteractorToPresenterViewControllerProtocol?
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacak.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumYapilacaklariAl() {
        var liste = [Yapilacak]()
        db?.open()
        
        do{
            let c = try db!.executeQuery("SELECT * FROM yapilacak", values: nil)
            
            while c.next(){
                let yapilacak = Yapilacak(
                    yapilacak_id: Int(c.string(forColumn: "yapilacak_id"))!,
                    yapilacak_is: c.string(forColumn: "yapilacak_is")!)
                
                liste.append(yapilacak)
            }
            viewControllerPresenter?.presenteraVeriGonder(yapilacakListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilacakAra(aramaKelimesi: String) {
        print("Arama Sonucu : \(aramaKelimesi)")
        var liste = [Yapilacak]()
        db?.open()
        
        do{
            let c = try db!.executeQuery("SELECT * FROM yapilacak WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            
            while c.next(){
                let yapilacak = Yapilacak(
                    yapilacak_id: Int(c.string(forColumn: "yapilacak_id"))!,
                    yapilacak_is: c.string(forColumn: "yapilacak_is")!)
                
                liste.append(yapilacak)
            }
            viewControllerPresenter?.presenteraVeriGonder(yapilacakListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilacakSil(yapilacak_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM yapilacak WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumYapilacaklariAl()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
