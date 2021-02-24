//
//  WebService.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 24/02/2021.
//

import Foundation


struct Resources<T> {
    
    let url:URL
    let parse: (Data) ->T?
}

struct WebService {
    
    func load<T>(_ resource:Resources<T> ,completion:@escaping (T?) ->() ) {
        
        URLSession.shared.dataTask(with: resource.url) { (data, responser, error) in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
        
    }
}