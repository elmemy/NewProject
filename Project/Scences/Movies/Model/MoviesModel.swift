//
//  MoviesModel.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import Foundation

// MARK: - MoviesModel
struct MoviesModel: Codable,CodableInit {
    let status: String?
    let status_message: String?
    let data: Movies?
}

// MARK: - DataClass
struct Movies: Codable {
    let movieCount, limit, page_number: Int?
    let movies: [Movie]?
}

// MARK: - Movie
struct Movie: Codable {
    let id: Int?
    let url: String?
    let imdbCode, title, titleEnglish, titleLong: String?
    let slug: String?
    let year: Int?
    let rating: Double?
    let runtime: Int?
    let summary, descriptionFull, synopsis, ytTrailerCode: String?
    let language, mpaRating: String?
    let backgroundImage, backgroundImageOriginal, smallCoverImage, mediumCoverImage: String?
    let largeCoverImage: String?
    let dateUploaded: String?
    let dateUploadedUnix: Int?
}

