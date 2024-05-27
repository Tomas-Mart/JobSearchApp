//
//  OffersModel.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 27.05.2024.
//

import Foundation


struct Offers: Codable, Hashable {
    let vacancies: [Vacancies]
}

struct Vacancies: Codable, Hashable {
    let lookingNumber: Int?
    let title: String?
    let address: Address
    let company: String?
    let experience: Experience
    let publishedDate: String?
    let isFavorite: Bool?
    let salary: Salary
    let schedules: [String]?
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String?
    let questions: [String]?
}

struct Address: Codable, Hashable {
    let town: String?
    let street: String?
    let house: String?
}

struct Experience: Codable, Hashable {
    let previewText: String?
    let text: String?
}

struct Salary: Codable, Hashable {
    let full: String?
}
