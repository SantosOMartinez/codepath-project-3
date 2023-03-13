//
//  Api.swift
//  Project 3
//
//  Created by Santos O. Martínez Braña on 3/13/23.
//
import Foundation

let API_KEY = "9eabaa82bc2f053afba84ea81a53667e"

let baseImageUrl = "https://image.tmdb.org/t/p/w500"
let baseNowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key="


func createUrl(_ url: String) -> URL? {
    URL(string: url)
}

let nowPlayingUrl = createUrl(baseNowPlayingUrl + API_KEY)


func createImageUrl(_ image: String) -> URL? {
    createUrl(baseImageUrl + image)
}

func createSimilarMoviesUrl(_ id: Int)-> URL? { createUrl("https://api.themoviedb.org/3/movie/\(id)/similar?api_key=\(API_KEY)")
}

func fetchMovies(completion: @escaping([Movie]) -> Void){
    guard let url = nowPlayingUrl else {
        return
    }

    let dataTask = URLSession.shared.dataTask(with: url)
    { (data, _, error) in
        guard error == nil else {
            print("Error while fetching data. Defaulting to mock data.")
            completion(Movies.mockMovies)
            return
        }

        guard let data = data else {
            print("No data received on fetch. Defaulting to mock data.")
            completion(Movies.mockMovies)
            return
        }

        let decoder = JSONDecoder()

        do {
            let decodedData = try decoder.decode(Movies.self, from: data)
            let complete = decodedData.results
                .sorted(by: {$0.popularity > $1.popularity})
                .enumerated().map{ i, m in
                    var newM = m
                    newM.placement = i
                    return newM
            }

            completion(complete)
        } catch {
            print ("Error decoding data. Defaulting to mock data.")
            completion(Movies.mockMovies)
        }
    }
    dataTask.resume ()
}

func fetchSimilarMovies(id:Int ,completion: @escaping([Movie]) -> Void){
    guard let url = createSimilarMoviesUrl(id) else {
        return
    }

    let dataTask = URLSession.shared.dataTask(with: url)
    { (data, _, error) in
        guard error == nil else {
            print("Error while fetching data. Defaulting to mock data.")
            completion(Movies.mockMovies)
            return
        }

        guard let data = data else {
            print("No data received on fetch. Defaulting to mock data.")
            completion(Movies.mockMovies)
            return
        }

        let decoder = JSONDecoder()

        do {
            let decodedData = try decoder.decode(Movies.self, from: data)
            let complete = decodedData.results
                .sorted(by: {$0.popularity > $1.popularity})
                .enumerated().map{ i, m in
                    var newM = m
                    newM.placement = i
                    return newM
            }

            completion(complete)
        } catch {
            print(error)
            print ("Error decoding data. Defaulting to mock data.")
            completion(Movies.mockMovies)
        }
    }
    dataTask.resume ()
}
