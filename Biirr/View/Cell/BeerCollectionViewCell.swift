//
//  BeerCollectionViewCell.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 26/02/2021.
//

import UIKit
import SDWebImage

final class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var beerName: UILabel!
    @IBOutlet private weak var beerCategory: UILabel!
    @IBOutlet private weak var beerImage: UIImageView!
    
    var beer:BeerViewModel? {
        
        didSet {
            
            if let beer  = beer {
                
                beerName.text = beer.getBeerName()
                beerCategory.text = beer.getCategory()
                beerImage.setFromUrl(url: beer.getListDisplayImage())
            }
        }
    }
    
    
    override func prepareForReuse() {
        
        beerImage.image = nil
        beerImage.sd_cancelCurrentImageLoad()
    }
}
