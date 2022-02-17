//
//  ViewController.swift
//  Homework006
//
//  Created by Ozcan Biyik on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kategoriCollectionView: UICollectionView!
    @IBOutlet weak var marketButton: UIButton!
    
    
    var kategoriListesi = [Kategoriler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        kategoriCollectionView.delegate = self
        kategoriCollectionView.dataSource = self
        
        let k1 = Kategoriler(kategoriResimAdi: "dondurma")
        let k2 = Kategoriler(kategoriResimAdi: "ev-yasam-ve-bahce")
        let k3 = Kategoriler(kategoriResimAdi: "icecekler")
        let k4 = Kategoriler(kategoriResimAdi: "kahvaltilik-ve-sut")
        let k5 = Kategoriler(kategoriResimAdi: "meyve-ve-sebze")
        let k6 = Kategoriler(kategoriResimAdi: "pet-shop")
        let k7 = Kategoriler(kategoriResimAdi: "su")
        let k8 = Kategoriler(kategoriResimAdi: "tatli")
        
        kategoriListesi.append(k1)
        kategoriListesi.append(k2)
        kategoriListesi.append(k3)
        kategoriListesi.append(k4)
        kategoriListesi.append(k5)
        kategoriListesi.append(k6)
        kategoriListesi.append(k7)
        kategoriListesi.append(k8)
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let genislik = kategoriCollectionView.frame.size.width
        let hucreGenislik = (genislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik * 1.75)
        
        kategoriCollectionView.collectionViewLayout = tasarim
        
        marketButton.layer.borderColor = UIColor.green.cgColor
        marketButton.layer.borderWidth = 0.5
        marketButton.layer.cornerRadius = 10
        
    }


}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kategoriListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kategori = kategoriListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kategoriHucre", for: indexPath) as! CollectionViewHucre
        
        cell.hucreImage.image = UIImage(named: kategori.kategoriResimAdi!)
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 10
        
        return cell
        
        
    }
    
    
}
