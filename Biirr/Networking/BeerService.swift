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
    func getAllBears(completion:@escaping (Beers?) ->())
}

class BeerService  : IBeerService {
    
    var webService : IWebService
    var url:URL = URL(string: Constants.testUrl)!
    
    init(_ service:IWebService)
    {
        self.webService = service
    }
    //note Return result here
    func getAllBears(completion:@escaping (Beers?) ->()){
        
        if let resource = getResource() {
            
            webService.load(resource) { (data) in
                
                if let data = data {
                    DispatchQueue.main.async {
                        completion(data)
                    }
                }
                else{
                    completion(nil)
                }
            }
        }
        else{
            completion(nil)
        }
    }
    
    func getResource() -> Resources<Beers>? {
        
        return Resources<Beers>(url: self.url) { data in
            
            return try? JSONDecoder().decode(Beers.self, from: data)
        }
    }
    
    
}
