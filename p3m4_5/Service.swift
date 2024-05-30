//
//  Service.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 16.03.2024.
//

import Foundation

class Service {
    
    func loadJson(filename fileName: String, completion: @escaping ([Vacancie]) -> ()) {
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
