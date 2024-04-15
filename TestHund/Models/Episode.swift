//
//  Episode.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import Foundation

struct Episode: Identifiable, Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
}

struct EpisodesResponse: Codable {
    let results: [Episode]
}
