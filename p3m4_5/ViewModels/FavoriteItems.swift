//
//  FavoriteItems.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 30.05.2024.
//

import Foundation

final class FavoriteItemsViewModel: ObservableObject {
    
    @Published var favoriteItems: [Vacancie] = []
    
    func addInFavorites(for index: Int) {
        favoriteItems.append(favoriteItems[index])
    }
}
