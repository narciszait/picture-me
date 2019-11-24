//
//  HomeItemCollectionCellCollectionViewCell.swift
//  Picture Me
//
//  Created by Narcis Zait on 23/11/2019.
//  Copyright © 2019 Narcis Zait. All rights reserved.
//

import UIKit

protocol HomeItemProtocol {
    func configure(artistName: String, shopName: String, country: String, imageUrl: String)
}

class HomeItemCollectionCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var artistNameLabel: UILabel! {
        didSet {
            //all the styling can be done with a simple setStyle(fontSize, font, fontStyle) method
            artistNameLabel.textColor = .white
        }
    }
    
    @IBOutlet weak var shopNameLabel: UILabel! {
        didSet {
            shopNameLabel.textColor = .white
        }
    }
    
    @IBOutlet weak var countryLabel: UILabel! {
        didSet {
            countryLabel.textColor = .white
            countryLabel.font = countryLabel.font.withSize(40)
        }
    }
    
    @IBOutlet weak var flagView: UIView! {
        didSet {
            flagView.layer.cornerRadius = flagView.frame.height / 2
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = self.contentView.layer.cornerRadius
        
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
//        blurredEffectView.frame = backgroundImageView.bounds
//        backgroundImageView.addSubview(blurredEffectView)
    }
    
    override func prepareForReuse() {
        backgroundImageView.image = nil
        artistNameLabel.text = ""
        shopNameLabel.text = ""
    }
}

extension HomeItemCollectionCellCollectionViewCell: HomeItemProtocol {
    func configure(artistName: String, shopName: String, country: String, imageUrl: String) {
        artistNameLabel.text = artistName
        shopNameLabel.text = shopName
        countryLabel.text = flag(country: country)
        
        backgroundImageView.download(from: imageUrl, contentMode: .scaleAspectFill)
    }
}
