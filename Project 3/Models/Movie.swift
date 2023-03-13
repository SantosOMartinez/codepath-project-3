//
//  Movie.swift
//  Project 2
//
//  Created by Santos O. Martínez Braña on 3/2/23.
//

import Foundation
import Nuke

struct Movies: Decodable {
    var results: [Movie]
}

struct Movie:Decodable {
    let id: Int
    let poster: String?
    let backdrop: String?
    let title: String
    let popularity: Double
    let voteAvg: Double
    let voteCount: Int
    let overview: String
    var placement: Int?

    enum CodingKeys:String, CodingKey {
        case id
        case poster = "poster_path"
        case backdrop = "backdrop_path"
        case title
        case popularity
        case voteAvg = "vote_average"
        case voteCount = "vote_count"
        case overview
        case placement
    }
}




extension Movies {
    static var mockMovies: [Movie] = [
        Movie(
              id: 631842,
              poster: "/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg",
              backdrop: "/hegMHNsxYGlGgVgaGz9FqxPqImr.jpg",
              title: "Knock at the Cabin",
              popularity: 3287.614, voteAvg:  6.5, voteCount: 608,
              overview: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
              placement: 0),
        Movie(
              id: 505642,
              poster: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
              backdrop: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
              title: "Black Panther: Wakanda Forever",
              popularity: 2605.02, voteAvg: 7.4, voteCount: 3660,
              overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              placement: 1),
        Movie(
              id: 646389,
              poster: "/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg",
              backdrop: "/irwQcdjwtjLnaA0iErabab9PrmG.jpg",
              title: "Plane",
              popularity: 2277.913, voteAvg: 6.9, voteCount: 683,
              overview: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.",
              placement: 2),
        Movie(
              id: 315162,
              poster: "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
              backdrop: "/b1Y8SUb12gPHCSSSNlbX4nB3IKy.jpg",
              title: "Puss in Boots: The Last Wish",
              popularity: 2251.995, voteAvg: 8.5, voteCount: 4094,
              overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              placement: 3),
        Movie(
              id: 1058949,
              poster: "/cmWTZj9zzT9KFt3XyL0gssL7Ig8.jpg",
              backdrop: "/k4V6EvpcOsu8CX10JD0H53lFXLq.jpg",
              title: "Little Dixie",
              popularity: 1598.526, voteAvg: 6.2, voteCount: 26,
              overview: "Erstwhile Special Forces operative Doc Alexander is asked to broker a truce with the Mexican drug cartel in secrecy. When Oklahoma Governor Richard Jeffs celebrates the execution of a high-ranking cartel member on TV, his Chief of Staff and Doc inform him about the peace he just ended. But it’s too late, as Cuco, the cartel’s hatchet man, has set his vengeful sights on Doc’s daughter Dixie.",
              placement: 4),
        Movie(
              id: 772515,
              poster: "/1mZcxuL4GLUvPdEXC4iZPjG2EO3.jpg",
              backdrop: "/A2avUoNFstnBhAnHiogXQs4c9Bt.jpg",
              title: "Huesera: The Bone Woman",
              popularity: 1274.72, voteAvg: 6.4, voteCount: 32,
              overview: "Valeria's joy at becoming a first-time mother is quickly taken away when she's cursed by a sinister entity. As danger closes in, she's forced deeper into a chilling world of dark magic that threatens to consume her.",
              placement: 5)
        ]
}
