//
//  YapilacakKayitRouter.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

class YapilacakKayitRouter : PresenterToRouterYapilacakKayitProtocol{
    static func createModule(ref: YapilacakKayitVC) {
        ref.yapilacakKayitPresenterNesnesi = YapilacakKayitPresenter()
        ref.yapilacakKayitPresenterNesnesi?.yapilacakKayitInteractor = YapilacakKayitInteractor()
    }
}
