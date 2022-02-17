//
//  YapilacakDetayProtocols.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

protocol PresenterToInteractorYapilacakDetayProtocol{
    func yapilacakGuncelle(yapilacak_id : Int, yapilacak_is : String)
}

protocol ViewToPresenterYapilacakDetayProtocol{
    
    var yapilacakDetayInteractor : PresenterToInteractorYapilacakDetayProtocol?{get set}
    
    func guncelle(yapilacak_id : Int, yapilacak_is : String)
}

protocol PresenterToRouterYapilacakDetayProtocol{
    static func createModule(ref : YapilacakDetayVC)
}
