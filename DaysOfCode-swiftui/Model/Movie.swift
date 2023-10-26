//
//  Movie.swift
//  DaysOfCode-swiftui
//
//  Created by Michelli Cristina de Paulo Lima on 25/10/23.
//

import Foundation

struct MovieResults: Codable {
    let results: [Movie]
}

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let image: String?
    let overview: String
    let voteAverage: Double

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case image = "poster_path"
        case overview
        case voteAverage = "vote_average"
    }

}
