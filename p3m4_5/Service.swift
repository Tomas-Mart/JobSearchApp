//
//  Service.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 16.03.2024.
//

import Foundation

class Service {
    
    // https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14
    
    func getNews(completion: @escaping ([Vacancies]) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "run.mocky.io"
        urlComponents.path = "/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
        
        guard let url = urlComponents.url else {return}
        let req = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: req) { data, response, error in
            guard error == nil, let resData = data else {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Offers.self, from: resData)
                completion(result.vacancies)
                print(result)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
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


