//
//  InfoViewController.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/2/23.
//

import UIKit
import Nuke

class InfoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var voteAvg: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var laurelLeft: UIImageView!
    @IBOutlet weak var laurelRight: UIImageView!
    @IBOutlet weak var moviePlacement: UILabel!
    @IBOutlet weak var placementImage: UIImageView!


    var placement: Int = 0
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        customStyle()
        scrollView.delegate = self


        let formatter = customFormat()

        movieTitle.text = movie.title
        movieDescription.text = movie.overview

        formatter.minimumFractionDigits = 3
        moviePopularity.text = formatter.string(for: movie.popularity)

        formatter.minimumFractionDigits = 1
        voteAvg.text = formatter.string(for: movie.voteAvg)

        formatter.minimumFractionDigits = 0
        voteCount.text = formatter.string(for: movie.voteCount)

        Nuke.loadImage(with: createImageUrl(movie.backdrop ?? "")!, into: backdrop)

        handlePlacement()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        typealias ListView = MoviesViewController

        guard let listView = segue.destination as? ListView else {
            return
        }

        fetchSimilarMovies(id: movie.id, completion: {m in
            DispatchQueue.main.async {
                listView.movies = m
                listView.tableView.reloadData()
            }
        })


    }

    func customStyle(){
        backdrop.layer.cornerRadius = 16
        backdrop.layer.borderColor = UIColor(named: "secondaryBg")?.cgColor
        backdrop.layer.borderWidth = 0.5
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alpha = scrollView.contentOffset.y / (movieTitle.frame.height)
        movieTitle.layer.opacity = 1 - Float(alpha)
    }

    func customFormat() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.minimumFractionDigits = 1
        return formatter
    }

    func handlePlacement() {
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

}
