//
//  Category.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 24.02.2022.
//

import SwiftUI

// Model And Sample Data....

// Product Model....
struct Category: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: CategoryType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

// Product Types...
enum CategoryType: String,CaseIterable{
    case Shashlik = "Шашлыки"
    case Pizza = "Пиццы"
    case Soup = "Супы"
    case Salad = "Салаты"
    case Baking = "Выпечки"
    case Drinks = "Напитки"
}



