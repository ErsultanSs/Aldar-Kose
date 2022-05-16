//
//  SharedDataModel.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 26.02.2022.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    // Detail Menu Data...
    @Published var detailMenu: Category?
    
    @Published var showDetailMenu: Bool = false
    
    // Liked Products...
    @Published var likedProducts: [Category] = []
    
    // basket Products...
    @Published var cartProducts: [Category] = []
    
    // calculating Total price...
    func getTotalPrice()->String{
        
        var total: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        
        return "\(total) тг"
    }
    
}

