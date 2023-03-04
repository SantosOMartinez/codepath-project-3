//
//  CollectionViewController.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/3/23.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "CollectionCell",
                                 for: indexPath) as! CollectionCell

        let movie = movies[indexPath.row]

        cell.movie = movie
        cell.placement = indexPath.row
        cell.alpha = 0

        animateEnter(cell, indexPath.row)

        return cell
    }

    private func collectionView(collectionView: UICollectionView,
                                didSelectItemAtIndexPath indexPath:
                                NSIndexPath) {
        performSegue(withIdentifier: "InfoSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        typealias InfoView = InfoViewController

        guard let cell = sender as? UICollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell),
              let infoView = segue.destination as? InfoView else {
            return
        }

        let placement = indexPath.row
        infoView.placement = placement
        infoView.movie = movies[placement]

        collectionView.deselectItem( at: indexPath, animated: true)
    }

    func animateEnter(_ cell: CollectionCell, _ index: Int){
        let duration = index < 10 ? 0.3 * Double(index + 1) : 0.3

        cell.alpha = 0
        UIView.animate(withDuration: duration) {
            cell.alpha = 1
        }
    }

}
