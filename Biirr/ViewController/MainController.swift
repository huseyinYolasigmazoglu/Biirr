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
    private var beerListVM : BeerListViewModel?
    private var cellWidth:CGFloat  = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        cellWidth =  (view.bounds.width - 15) 
  
        beerService = BeerService(webService)
    
        beerService.getAllBears { (beers) in
            
            self.beerListVM = BeerListViewModel(beers?.data)
            self.collectionView.reloadData()
            
        }
    }
}

extension MainController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.beerListVM?.numberOfCounts() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCell", for: indexPath) as? BeerCollectionViewCell else{
            
            fatalError("BeerCell as? BeerCollectionViewCell not found")
        }
        
        cell.beer = beerListVM?.getItemAtIndexPath(indexPath)
        
        return cell
    }
    
    
}

extension MainController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.gotoDetailSegue, sender: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidth, height: cellWidth * 1.2)
    }
    
}

