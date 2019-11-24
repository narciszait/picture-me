//
//  DetailViewController.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tatooImageView: UIImageView!
    @IBOutlet weak var flagView: UIView! {
        didSet {
            flagView.layer.cornerRadius = flagView.frame.height / 2
            flagView.backgroundColor = .white
        }
    }
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var hashtagsLabel: UILabel!
    @IBOutlet weak var motifsLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var reviewExample: UITextView!
    
    
    
    private var presenter: DetailPresenterInput!

    class func instantiate(with presenter: DetailPresenterInput) -> DetailViewController {
        let name = "\(DetailViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! DetailViewController
        vc.presenter = presenter
        return vc
    }

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewCreated()
        
        navigationItem.title = presenter.title
        
        tatooImageView.download(from: presenter.imageUrl, contentMode: .scaleAspectFill)
        countryLabel.text = flag(country: presenter.country)
        countryLabel.font = countryLabel.font.withSize(40)
        artistNameLabel.text = presenter.artistName
        hashtagsLabel.text = presenter.hashtags.joined(separator: ", ")
        motifsLabel.text = presenter.motifs.joined(separator: ", ")
        reviewsLabel.text = "Just as an example. It would be nice to have this as a horizontal scroll view"
        reviewExample.text = presenter.reviewExample.joined()
    }
}

// MARK: - Display Logic -

// PRESENTER -> VIEW
extension DetailViewController: DetailPresenterOutput {

}
