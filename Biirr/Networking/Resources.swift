//
//  Resources.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 24/02/2021.
//

import Foundation

struct Resources<T> {
    
    let url:URL
    let parse: (Data) ->T?
}
