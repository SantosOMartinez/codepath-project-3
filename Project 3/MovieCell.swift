//
//  MovieCell.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/2/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var voteAvg: UILabel!
    @IBOutlet weak var moviePlacement: UILabel!
    @IBOutlet weak var placementImage: UIImageView!
    @IBOutlet weak var laurelRight: UIImageView!
    @IBOutlet weak var laurelLeft: UIImageView!

    var placement: Int!
    
    func configure(with movie: Movie) {
        customStyle()
        let formatter = customFormat()

        movieTitle.text = movie.title
        movieDescription.text = movie.overview
        voteAvg.text = formatter.string(for: movie.voteAvg)
        placement = movie.placement

        Nuke.loadImage(with: createImageUrl(movie.poster ?? "")!, into: moviePoster)
        handlePlacement(movie.placement!)
    }

    func customStyle(){
        moviePoster.layer.cornerRadius = 12
    }

    func customFormat() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.minimumFractionDigits = 1
        return formatter
    }

    func handlePlacement(_ placement: Int) {
        let formatter = customFormat()
        formatter.numberStyle = .ordinal
        formatter.minimumFractionDigits = 0

        moviePlacement.text = formatter.string(for: placement + 1)

        if placement > 0 {
            laurelLeft.image = nil
            laurelRight.image = nil
        }

        if placement >= 3 {
            let color = UIColor(named: "caption")!
            let trophy = UIImage(systemName: "trophy")?
                .withTintColor(color, renderingMode: .alwaysOriginal)
            placementImage.image = trophy
            moviePlacement.textColor = color
        }
    }

    func animateEnter( _ index: Int){
        let duration = index < 5 ? 0.2 * Double(index + 1) : 0.2 * 2
        alpha = 0
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }
}
