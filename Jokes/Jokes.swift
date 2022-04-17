//
//  Jokes.swift
//  Jokes
//
//  Created by Алексей Каземиров on 4/17/22.
//

import Foundation

// MARK: - Jokes
struct Joke: Codable {
    let error: Bool?
    let category, type, setup, delivery: String?
    let flags: Flags?
    let safe: Bool?
    let id: Int?
    let lang: String?
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool?
    let sexist, explicit: Bool?
}
