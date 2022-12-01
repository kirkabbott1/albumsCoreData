//
//  Albums.swift
//  albumsCoreData
//
//  Created by Kirk Abbott on 11/25/22.
//

import Foundation



struct Albums: Decodable {
    
    let feed: Feed
}

// MARK: - Feed
struct Feed: Decodable {
//    let title: String?
//    let id: String?
//    let author: Author?
//    let links: [Link]?
//    let copyright, country: String?
//    let icon: String?
//    let updated: String?
    let results: [Result]
}

// MARK: - Author
struct Author: Decodable {
    let name: String
    let url: String
}



// MARK: - Result
struct Result: Decodable {
    let artistName, id, name, releaseDate: String?
    let kind: Kind?
    let artistID: String?
    let artistURL: String?
    let artworkUrl100: URL?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }
}

enum ContentAdvisoryRating: String, Decodable {
    case explict = "Explict"
}

// MARK: - Genre
struct Genre: Decodable {
    let genreID, name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Decodable {
    case albums = "albums"
}
