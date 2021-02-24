//
//  ViewController.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 24/02/2021.
//

import UIKit

final class MainController: UIViewController {

    private var webService : IWebService = WebService()
    private var beerService: IBeerService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        beerService = BeerService(webService)
    
        beerService.getAllBears { (beers) in
            print(beers)
        }

    }

}

