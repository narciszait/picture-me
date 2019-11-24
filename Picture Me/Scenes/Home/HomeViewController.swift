//
//  HomeViewController.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private var presenter: HomePresenterInput!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "HomeItemCollectionCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeItemCell")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    

    class func instantiate(with presenter: HomePresenterInput) -> HomeViewController {
        let name = "\(HomeViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! HomeViewController
        vc.presenter = presenter
        return vc
    }

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewCreated()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeItemCell", for: indexPath) as! HomeItemCollectionCellCollectionViewCell
        
        presenter.configure(item: cell, at: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.handle(action: .itemSelected(row: indexPath.row))
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            presenter.handle(action: .loadMoreItems)
        }
    }
}

// MARK: - Display Logic -

// PRESENTER -> VIEW
extension HomeViewController: HomePresenterOutput {
    func display(_ displayModel: Home.DisplayData.Search) {
        collectionView.reloadData()
    }
    
    func display(_ error: Home.DisplayData.Error) {
        let alertController = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    

}
