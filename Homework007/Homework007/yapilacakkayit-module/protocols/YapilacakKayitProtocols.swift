//
//  YapilacakKayitProtocols.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

protocol PresenterToInteractorYapilacakKayitProtocol{
    func yapilacakEkle(yapilacak_is : String)
}

protocol ViewToPresenterYapilacakKayitProtocol{
    var yapilacakKayitInteractor : PresenterToInteractorYapilacakKayitProtocol?{get set}
    func ekle(yapilacak_is : String)
}

protocol PresenterToRouterYapilacakKayitProtocol{
    static func createModule(ref : YapilacakKayitVC)
}
