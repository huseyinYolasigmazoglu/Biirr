//
//  BeerCollectionViewCell.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 26/02/2021.
//

import UIKit
import SDWebImage

final class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private  weak var beerName: UILabel!
    
    @IBOutlet weak var beerCategory: UILabel!
    
    @IBOutlet weak var beerImage: UIImageView!
    
    
    
    var beer:BeerViewModel? {
        
        didSet {
            if let beer  = beer {
                
                beerName.text = beer.getBeerName()
                beerCategory.text = beer.getCategory()
                
                if let image = beer.getListDisplayImage()
                {
                    beerImage.sd_setImage(with: image)
                }

                
            }
            
        }
    }
    
    
    override func prepareForReuse() {
        
        beerImage.sd_cancelCurrentImageLoad()
    }
    
    
}
