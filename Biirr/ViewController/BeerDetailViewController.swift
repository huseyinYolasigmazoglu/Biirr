//
//  BeerDetailViewController.swift
//  Biirr
//
//  Created by Huseyin Yolasigmazoglu on 26/02/2021.
//

import UIKit
import SDWebImage

final class BeerDetailViewController: UIViewController {
    
    
    @IBOutlet private weak var bearImage: UIImageView!
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var category: UILabel!
    @IBOutlet private weak var explanation: UITextView!
    
    var beerVM : BeerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        explanation.delegate = self
        //explanation.inputView = UIView()
        
        if let beerVM = beerVM {
            
            bearImage.setFromUrl(url: beerVM.getListDisplayImage())
            
            name.text = beerVM.getBeerName()
            category.text = beerVM.getCategory()
            explanation.text = beerVM.getDescription()
            
        }
        
        
    }
    
}

extension BeerDetailViewController: UITextViewDelegate {
    
    
    
    private func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    
            return false
    }
}
