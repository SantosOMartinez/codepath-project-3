//
//  TabViewController.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/3/23.
//

import UIKit

class TabViewController: UITabBarController {

    var movies: [Movie]? {
        didSet {
            DispatchQueue.main.async {
                self.updateData()
            }

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Movie.fetchMovies { self.movies = $0}
    }

    func updateData(){
        guard let tab1 = viewControllers?[0] as? MoviesViewController,
              let tab2 = viewControllers?[1] as? CollectionViewController else {
            return
        }
        tab1.movies = movies ?? []
        tab2.movies = movies ?? []

        tab1.tableView?.reloadData()
        tab2.collectionView?.reloadData()
    }
}
