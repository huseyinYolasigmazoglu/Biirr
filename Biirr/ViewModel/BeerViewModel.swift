//
//  BeerViewModel.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 26/02/2021.
//

import Foundation


struct BeerViewModel {
    
    private var beer : Beer
    
    init(_ beer:Beer) {
        
        self.beer = beer
    }
    
    func getBeerName() -> String {
        
        return beer.nameDisplay ?? ""
    }
    
    func getListDisplayImage() -> URL? {
        
        return beer.labels?.large
    }
    
    func getDetailImage() -> URL? {
        
        return beer.labels?.large
    }
    
    func getCategory() -> String {
        
        return beer.style?.category?.name ?? ""
    }
    
    func getDescription() -> String {
        
        return beer.style?.description ?? ""
    }
    
    func getBitter() -> String {
        
        if let ibu = beer.ibu {
            
            let value = Int(ibu) ?? 0
            if value == 0 {
                return ""
            }
            else if value <= 20{
                return "Smooth"
            }
            else if value <= 50 {
                return "Bitter"
            }
            else {
                return "Hipster Plus"
            }
            
        }
        else {
            return ""
        }
        
       
    }
}
