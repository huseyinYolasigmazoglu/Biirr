//
//  Beers.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 24/02/2021.
//

import Foundation

struct Beers : Codable {
    
    let currentPage: Int?
    let numberOfPages:Int?
    let data:[Beer]?
}

struct Beer : Codable {
    let id:String?
    let nameDisplay:String?
    let ibu:String?
    let style:Style?
    let labels:Images?
}

struct Style : Codable {
    let id:Int?
    let categoryId:Int?
    let category:Category?
    let name:String?
    let shortName:String?
    let description:String?
}
struct Category:Codable {
    let id: Int?
    let name: String?
}

struct Images:Codable {
    let icon: URL?
    let medium: URL?
    let large: URL?
    let contentAwareIcon: URL?
    let contentAwareMedium: URL?
    let contentAwareLarge: URL?
}
