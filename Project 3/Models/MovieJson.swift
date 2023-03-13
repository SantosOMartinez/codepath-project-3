//
//  MovieJson.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/3/23.
//

import Foundation

struct MoviesJson: Decodable {
    let results: [MovieJson]
}

struct MovieJson: Decodable {
    let backdrop_path: String
    let poster_path: String
    let overview: String
    let title: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
}
