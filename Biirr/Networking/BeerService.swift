//
//  BearService.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 24/02/2021.
//

import Foundation

protocol IBeerService {
    var webService : IWebService { get set }
    var url:URL { get set }
    func getAllBears()
}

class BeerService  : IBeerService {
    
    var webService : IWebService
    var url:URL = URL(string: Constants.testUrl)!
    
    init(_ service:IWebService)
    {
        self.webService = service
    }
    
    func getAllBears(){
        
        
        if let resource = getResource() {
            
            webService.load(resource) { (data) in
                
                print(data)
            }
        }
        
        
    }
    
    
    func getResource() -> Resources<Beers>? {
        
        return Resources<Beers>(url: self.url) { data in
            
            return try? JSONDecoder().decode(Beers.self, from: data)
        }
    }
    
    
}
