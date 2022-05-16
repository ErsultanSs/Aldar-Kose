//
//  MenuViewModel.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 24.02.2022.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    
    @Published var categoryType: CategoryType = .Soup
    
    // Sample Menu...
    @Published var categories: [Category] = [
        // MARK: - SOUP
        Category(type: .Soup, title: "Борщ Сибирский", subtitle: "Традиционный овощной суп, подается со сметаной.", price: "990 тг.", productImage: "soup-1"),
        Category(type: .Soup, title: "Шурпа из Баранины", subtitle: "Ароматный суп из мяса молодого барашка с добавлением овощей и специи.", price: "1090 тг.", productImage: "soup-2"),
        Category(type: .Soup, title: "Суп-Пюре из Чечевицы", subtitle: "Суп-Пюре из красной и зеленой чечевицы, подается с сухариками и зеленью.", price: "1090 тг.", productImage: "soup-3"),
        Category(type: .Soup, title: "Суйру-Лагман", subtitle: "Традиционный сытный суп из телятины и овощей, с добавлением специально приготовленной домашней лапши.", price: "990 тг.", productImage: "soup-4"),
        Category(type: .Soup, title: "Уха", subtitle: "Ароматный рыбный суп из семги с овощами и специями.", price: "1090 тг.", productImage: "soup-5"),
        
        // MARK: - BAKING
        Category(type: .Baking, title: "Лепешка Патыр-Нан", subtitle: "Национальный узбекский хлеб.", price: "120 тг.", productImage: "bakery-2"),
        Category(type: .Baking, title: "Cамса по Чайхански", subtitle: "Традиционный слоеный пирожок с сочной начинкой из рубленной баранины.", price: "390 тг.", productImage: "bakery-1"),
        
        
        // MARK: - PIZZA
        Category(type: .Pizza, title: "Пицца с Охотничьими Колбасками", subtitle: "Корнишоны, охотничьи колбаски, помидоры, сыр, специи и травы.", price: "2390 тг.",  productImage: "pizza-1"),
        Category(type: .Pizza, title: "Пицца Chicken", subtitle: "Копченая куриная грудка, томаты, сыр «Моцарелла», маслины, сырный соус, итальянские травы и специи.", price: "2390 тг.", productImage: "pizza-2"),
        Category(type: .Pizza, title: "Маргарита", subtitle: "Cвежие томаты, сыр моцарелла, маслины, итальянские травы и специи.", price: "1890 тг.", productImage: "pizza-3"),
        Category(type: .Pizza, title: "Пепперони", subtitle: "Cалями, перец пепперони, сыр моцарелла, маслины, итальянские травы и специи.", price: "2390 тг.",  productImage: "pizza-4"),
        
        // MARK: - SALAD
        Category(type: .Salad, title: "Салат с Курицей Гриль", subtitle: "Помидоры черри, лук красный, грибы, лист салата, курица гриль, мёдово - горчичной заправкой.", price: "1690 тг.",  productImage: "salad-1"),
        Category(type: .Salad, title: "Салат с Копченой Курицей и Чечелом", subtitle: "Листья салата, сыр чечел, сухарики, помидоры черри, копченая куриная грудка, майонез.", price: "1490 тг.",  productImage: "salad-2"),
        Category(type: .Salad, title: "Малибу", subtitle: "Пикантный салат из запеченной куриной грудкой, грибов, сочных помидоров, огурцов и сыра, подается с хрустящими сухариками.", price: "1090 тг.",  productImage: "salad-3"),
        Category(type: .Salad, title: "Салат Греческий", subtitle: "Классический салат из сладкого перца, сочных томатов и огурцов, листьев салата, красного лука и сыром фета с соусом песто.", price: "1390 тг.",  productImage: "salad-4"),
        Category(type: .Salad, title: "Чайна-Таун", subtitle: "Восточный салат из свежих овощей и мелконарубленной отварной телятины с соевой заправкой.", price: "1190 тг.",  productImage: "salad-5"),
        
        // MARK: - SHASHLIK
        Category(type: .Shashlik, title: "Окорочка", subtitle: "Часть тушки птицы, состоящая из бедренной и берцовых костей с прилегающими к ним мякотными тканями.", price: "1790 тг.",  productImage: "chicken-legs"),
        Category(type: .Shashlik, title: "Баранина", subtitle: "Маринованное мясо баранины по восточному рецепту, приготовленное на углях, подается с маринованным луком.", price: "2490 тг.",  productImage: "baranina"),
        Category(type: .Shashlik, title: "Цыпленок", subtitle: "Маринованное филе цыпленка, приготовленное на углях, подается с маринованным луком.", price: "2390 тг.",  productImage: "chick"),
        Category(type: .Shashlik, title: "Люля-Кебаб", subtitle: "Маринованное рубленное мясо телятины и баранины по восточному рецепту, приготовленное на углях, подается с маринованным луком.", price: "1790 тг.",  productImage: "lula-kebab"),
        
        
        // MARK: - DRINKS
        Category(type: .Drinks, title: "Кола, 0.5л", subtitle: "", price: "300 тг.",  productImage: "Coke-0.5"),
        Category(type: .Drinks, title: "Кола, 1.0л", subtitle: "", price: "500 тг.",  productImage: "Coke-1"),
        Category(type: .Drinks, title: "Pepsi, 0.5л", subtitle: "", price: "270 тг.",  productImage: "Pepsi-0.5"),
        Category(type: .Drinks, title: "Pepsi, 1.0л", subtitle: "", price: "500 тг.",  productImage: "Pepsi-1"),
        Category(type: .Drinks, title: "Gracio, Яблоко", subtitle: "", price: "700 тг.",  productImage: "gracio-apple"),
        Category(type: .Drinks, title: "Gracio, Апельсин", subtitle: "", price: "700 тг.",  productImage: "gracio-orange")
       
        
        

        
        
        
        
    ]
    
    // Filtered Products...
    @Published var filteredProducts: [Category] = []
    
    // More products on the type..
    @Published var showMoreProductsOnType: Bool = false
    
    init(){
        filterProductByType()
    }
    
    func filterProductByType(){
        
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.categories
            // Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { category in
                    
                    return category.type == self.categoryType
                }
            // Limiting result...
                .prefix(6)
            
            DispatchQueue.main.async {
                
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}


