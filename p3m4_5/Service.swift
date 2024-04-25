//
//  Service.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 16.03.2024.
//

import Foundation

class Service {
    
    func loadJson(filename fileName: String, completion: @escaping ([Vacancies]) -> ()) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Offers.self, from: data)
                completion(jsonData.vacancies)
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
    }
}

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
