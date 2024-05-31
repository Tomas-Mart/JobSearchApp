//
//  FavoriteItems.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 30.05.2024.
//

import Foundation

final class Database {
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<String>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<String> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [String] ?? [String]()
        return Set(array)
    }
}

final class FavoriteItemsViewModel: ObservableObject {
    
    @Published var favoriteItems: [Vacancie] = []
    
    func addInFavorites(for index: Int) {
        favoriteItems.append(favoriteItems[index])
    }
}
