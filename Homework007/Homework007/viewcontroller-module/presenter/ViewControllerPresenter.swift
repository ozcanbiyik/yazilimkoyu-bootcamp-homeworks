//
//  ViewControllerPresenter.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

class ViewControllerPresenter :ViewToPresenterViewControllerProtocol{
    
    var viewControllerView: PresenterToViewViewControllerProtocol?
    var viewControllerInteractor: PresenterToInteractorViewControllerProtocol?
    
    func yapilacaklariYukle() {
        viewControllerInteractor?.tumYapilacaklariAl()
    }
    
    func sil(yapilacak_id : Int){
        viewControllerInteractor?.yapilacakSil(yapilacak_id: yapilacak_id)
    }
    
    func ara(aramaKelimesi: String) {
        viewControllerInteractor?.yapilacakAra(aramaKelimesi: aramaKelimesi)
    }
}

extension ViewControllerPresenter : InteractorToPresenterViewControllerProtocol{
    func presenteraVeriGonder(yapilacakListesi: Array<Yapilacak>) {
        viewControllerView?.vieweVeriGonder(yapilacakListesi: yapilacakListesi)
    }
}
