//
//  AppleNewsVC.swift
//  CVDemos
//
//  Created by Shuvo on 8/30/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var provider: UILabel!
    @IBOutlet weak var title: UILabel!
}

struct News {
    let image: String
    let provider: String
    let title: String
    let cellType: NewsCellType
}

class AppleNewsVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var newsArray = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.delegate = self
        collectionView.dataSource = self
        let layout = AppleNewsLayout()
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        
        for i in 0..<10 {
            var cellType: NewsCellType = .big
            
            switch i {
            case 0, 5:
                cellType = .big
            case 1, 2, 8, 9:
                cellType = .vertical
            case 3, 4, 6, 7:
                cellType = .horizontal
            default:
                fatalError("error")
            }
            
            let news = News(image: "LionPdf", provider: "TIME is all I need", title: "Only I can change my life, no one can do it for me.", cellType: cellType)
            newsArray.append(news)
        }
    }
    
}

extension AppleNewsVC: AppleNewsLayoutDelegate {
    func AppleNewsFlowLayout(_ AppleNewsFlowLayout: AppleNewsLayout, cellTypeForItemAt indexPath: IndexPath) -> NewsCellType {
        
        return newsArray[indexPath.row].cellType
    }
}

extension AppleNewsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let news = newsArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: news.cellType.rawValue, for: indexPath) as! NewsCell
        cell.image.image = UIImage(named: news.image)!
        cell.provider.text = news.provider
        cell.title.text = news.title
        cell.contentView.backgroundColor = UIColor.cyan
        return cell
    }
}
