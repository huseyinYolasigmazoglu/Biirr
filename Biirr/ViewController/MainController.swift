//
//  ViewController.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 24/02/2021.
//

import UIKit

final class MainController: UIViewController{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var webService : IWebService = WebService()
    private var beerService: IBeerService!
    
    private var cellWidth:CGFloat  = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        cellWidth =  (view.bounds.width - 15) / 2
  
        beerService = BeerService(webService)
    
        beerService.getAllBears { (beers) in
            //print(beers?.data![0])
        }
    }
}

extension MainController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCell", for: indexPath)
    }
    
    
}

extension MainController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}

