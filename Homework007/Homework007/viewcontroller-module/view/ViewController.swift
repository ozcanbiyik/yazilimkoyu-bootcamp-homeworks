//
//  ViewController.swift
//  Homework007
//
//  Created by Ozcan Biyik on 3.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yapilacakTableView: UITableView!
    
    var yapilacakListe = [Yapilacak]()
    
    var viewControllerPresenterNesnesi : ViewToPresenterViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        yapilacakTableView.delegate = self
        yapilacakTableView.dataSource = self
    
        veritabaniKopyala()
        
        ViewControllerRouter.createModule(ref: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        viewControllerPresenterNesnesi?.yapilacaklariYukle()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            let yapilacak = sender as? Yapilacak
            let gidilecekVC = segue.destination as! YapilacakDetayVC
            gidilecekVC.yapilacak = yapilacak
        }
    }
    
    func veritabaniKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "yapilacak", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacak.sqlite")
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veri Tabanı zaten var")
        } else {
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
    }

}

extension ViewController : PresenterToViewViewControllerProtocol{
    func vieweVeriGonder(yapilacakListesi: Array<Yapilacak>) {
        self.yapilacakListe = yapilacakListesi
        self.yapilacakTableView.reloadData()
    }
}

extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewControllerPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacakListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacak = yapilacakListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacakHucre", for: indexPath) as! TableViewYapilacak
        hucre.yapilacakBilgiLabel.text = "\(yapilacak.yapilacak_is!)"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = yapilacakListe[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetay", sender: yapilacak)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (UIContextualAction,view,bool) in
            let yapilacak = self.yapilacakListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacak.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){action in}
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in self.viewControllerPresenterNesnesi?.sil(yapilacak_id: yapilacak.yapilacak_id!)}
            
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
