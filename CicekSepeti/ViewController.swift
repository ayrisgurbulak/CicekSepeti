//
//  ViewController.swift
//  CicekSepeti
//
//  Created by Ayris Gürbulak on 4.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let backgroundColor = UIColor(red: 0.9647, green: 0.9647, blue: 0.9647, alpha: 1.0)
    
    var collectionList = [CollectionViewData]()
    var tableList = [TableViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = backgroundColor
        collectionView.backgroundColor = backgroundColor
        tableView.backgroundColor = backgroundColor
        
        tabBarController?.tabBar.unselectedItemTintColor = .gray
        tabBarController?.tabBar.tintColor = UIColor(red: 0, green: 0.3725, blue: 0.7725, alpha: 1.0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.rowHeight = 130
        
        searchBar.barTintColor = backgroundColor
        
        tableView.separatorStyle = .none
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 360, height: 50))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 360, height: 50))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        logoContainer.addSubview(imageView)
        tabBarController?.navigationItem.titleView = logoContainer
        tabBarController?.navigationController?.navigationBar.isTranslucent = true

        
        let cv = CollectionViewData(image: "gul", label: "Güller")
        let cv2 = CollectionViewData(image: "orkide", label: "Aynı Gün Teslimat")
        let cv3 = CollectionViewData(image: "cikolata", label: "Çikolatalar")
        let cv4 = CollectionViewData(image: "hediye", label: "Aynı Gün Hediyeler")
        
        collectionList.append(cv)
        collectionList.append(cv2)
        collectionList.append(cv3)
        collectionList.append(cv4)
        
        let tc = TableViewData(image: "vazo2", title: "Paşabahçe Vazoda Tatlı Bahar", price: "94,99 TL", payment: "27,78 TL")
        let tc2 = TableViewData(image: "vazo1", title: "Paşabahçe Vazoda Kırmızı Gül", price: "109,00 TL", payment: "31,88 TL")
        let tc3 = TableViewData(image: "vazo3", title: "Paşabahçe Vazoda Düş Prensesi", price: "109,00 TL", payment: "31,88 TL")
        tableList.append(tc)
        tableList.append(tc2)
        tableList.append(tc3)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.itemSize = CGSize(width: 80, height: 150)
        collectionView.collectionViewLayout = tasarim
    }


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cc = collectionList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.collectionImage.layer.masksToBounds = true
        cell.collectionImage.contentMode = .scaleToFill
        cell.collectionImage.layer.cornerRadius = 40
        cell.collectionImage.image = UIImage(named: cc.image!)
        cell.collectionLabel.text = cc.label
        
        return cell
    }
    
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tc = tableList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.backgroundColor = UIColor(red: 0.9647, green: 0.9647, blue: 0.9647, alpha: 1.0)
        cell.subView.layer.cornerRadius = 5
        cell.tableImage.layer.cornerRadius = 5
        cell.tableImage.contentMode = .scaleToFill
        cell.tableImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        cell.titleLabel.text = tc.title
        cell.deliveryLabel.text = "Her Gün Aynı Gün / Ücretsiz Teslimat"
        cell.deliveryLabel.textColor = UIColor(red: 0.2392, green: 0.7137, blue: 0.2353, alpha: 1.0)
        cell.priceLabel.text = tc.price
        cell.paymentLabel.text = tc.payment! + "'den başlayan taksitlerle"
        cell.paymentLabel.textColor = UIColor(red: 0.2392, green: 0.7137, blue: 0.2353, alpha: 1.0)
        
        cell.tableImage.image = UIImage(named: tc.image!)
        cell.heartImage.layer.borderColor = UIColor.gray.cgColor
        cell.heartImage.layer.borderWidth = 0.5
        cell.heartImage.layer.cornerRadius = 5
        cell.heartImage.image = cell.heartImage.image?.withRenderingMode(.alwaysTemplate)
        cell.heartImage.tintColor = .red
        cell.numberLabel.textColor = UIColor(red: 0.1059, green: 0.2627, blue: 0.2824, alpha: 1.0)
        
        if indexPath.row == 1 {
            cell.starImage.image = UIImage(named: "bos-yıldız")
        }
        else {
            cell.starImage.image = UIImage(named: "star")
        }
        
        return cell
    }
    
    
}
