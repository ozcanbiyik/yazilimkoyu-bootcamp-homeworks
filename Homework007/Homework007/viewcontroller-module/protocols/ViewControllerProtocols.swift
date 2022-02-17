//
//  ViewControllerProtocols.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

protocol PresenterToInteractorViewControllerProtocol{
    
    var viewControllerPresenter : InteractorToPresenterViewControllerProtocol?{get set}
    
    func tumYapilacaklariAl()
    func yapilacakAra(aramaKelimesi : String)
    func yapilacakSil(yapilacak_id : Int)
}

protocol ViewToPresenterViewControllerProtocol{
    
    var viewControllerInteractor : PresenterToInteractorViewControllerProtocol?{get set}
    var viewControllerView : PresenterToViewViewControllerProtocol?{get set}
    
    func yapilacaklariYukle()
    func ara(aramaKelimesi : String)
    func sil(yapilacak_id : Int)
}

protocol InteractorToPresenterViewControllerProtocol{
    func presenteraVeriGonder(yapilacakListesi : Array<Yapilacak>)
}

protocol PresenterToViewViewControllerProtocol{
    func vieweVeriGonder(yapilacakListesi : Array<Yapilacak>)
}

protocol PresenterToRouterViewControllerProtocol{
    static func createModule(ref : ViewController)
}
