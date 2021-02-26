//
//  UIImageView+Extension.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 26/02/2021.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setFromUrl(url : URL?)  {
        
        if let url = url {
            self.sd_setImage(with: url)
        }
        else{
            self.image = Constants.defaultBeerImage
        }
    }
    
}
