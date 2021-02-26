//
//  BeerListViewModel.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 26/02/2021.
//

import Foundation

struct BeerListViewModel {
    
    private var beerList : [Beer]?
    
    init(_ beerList:[Beer]?) {
        
        self.beerList = beerList
    }
    
    func numberOfCounts() ->Int {
        
        return beerList?.count ?? 0
    }
    
    func getItemAtIndexPath(_ indexPath:IndexPath)-> BeerViewModel? {
        
        guard let item = beerList?[indexPath.row] else{
            return nil
        }
        
        return BeerViewModel(item)
    }
}
