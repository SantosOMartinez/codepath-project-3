//
//  MoviesViewController.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/2/23.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource,
                            UITableViewDelegate {

    var movies: [Movie] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                 for: indexPath) as! MovieCell

        let movie = movies[indexPath.row]
        cell.configure(with: movie)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        typealias InfoView = InfoViewController

        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell),
              let infoView = segue.destination as? InfoView else {
            return
        }

        let placement = indexPath.row
        infoView.placement = placement
        infoView.movie = movies[placement]
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func customFormat() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        formatter.locale = Locale.current
        return formatter
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        guard let cell = cell as? MovieCell else {
            return
        }
        cell.animateEnter(indexPath.row)

    }
}
