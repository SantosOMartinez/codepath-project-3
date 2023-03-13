//
//  CollectionCellCollectionViewCell.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/3/23.
//

import UIKit

import Nuke

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak var voteAvg: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!


    @IBOutlet weak var placementIcon: UIImageView!
    @IBOutlet weak var placementLabel: UILabel!
    @IBOutlet weak var laurelRight: UIImageView!
    @IBOutlet weak var laurelLeft: UIImageView!

    var movie: Movie!
    var placement: Int!

    override func layoutSubviews() {
        super.layoutSubviews()

        handlePlacement()

        movieTitle.text = movie.title

        Nuke.loadImage(with: Movie.buildUrl(movie.poster)!, into: poster)
        poster.layer.cornerRadius = 8

    }

    func customFormat() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        formatter.locale = Locale.current
        return formatter
    }

    func handlePlacement() {
        let formatter = customFormat()
        placementLabel.text = formatter.string(for: placement + 1)

        if placement > 0 {
            laurelLeft.image = nil
            laurelRight.image = nil
        }

        if placement >= 3 {
            let color = UIColor(named: "caption")!
            let trophy = UIImage(systemName: "trophy")?
                .withTintColor(color, renderingMode: .alwaysOriginal)
            placementIcon.image = trophy
            placementLabel.textColor = color
        }
    }

  
}
