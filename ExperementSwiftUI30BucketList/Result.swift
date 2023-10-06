//
//  Result.swift
//  ExperementSwiftUI30BucketList
//
//  Created by Валерия Дементьева on 06.10.2023.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
