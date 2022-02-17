//
//  YapilacakDetayRouter.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import Foundation

class YapilacakDetayRouter : PresenterToRouterYapilacakDetayProtocol{
    static func createModule(ref: YapilacakDetayVC) {
        ref.yapilacakDetayPresenterNesnesi = YapilacakDetayPresenter()
        ref.yapilacakDetayPresenterNesnesi?.yapilacakDetayInteractor = YapilacakDetayInteractor()
    }
}
