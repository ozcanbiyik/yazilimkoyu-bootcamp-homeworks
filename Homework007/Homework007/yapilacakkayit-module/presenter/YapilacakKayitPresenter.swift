//
//  YapilacakKayitPresenter.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

class YapilacakKayitPresenter : ViewToPresenterYapilacakKayitProtocol{
    var yapilacakKayitInteractor: PresenterToInteractorYapilacakKayitProtocol?
    func ekle(yapilacak_is: String) {
        yapilacakKayitInteractor?.yapilacakEkle(yapilacak_is: yapilacak_is)
    }
}
