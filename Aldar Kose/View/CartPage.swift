//
//  CartPage.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 26.02.2022.
//

import SwiftUI

struct CartPage: View {
    // MARK: - PROPERTY
    @EnvironmentObject var sharedData: SharedDataModel
    
    // Delete Option...
    @State var showDeleteOption: Bool = false
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack{
                            
                            Text("Корзина")
                                .font(.system(size: 28).bold())
                            
                            Spacer()
                            
                            Button {
                                showDeleteOption.toggle()
                            } label: {
                                Text("Удалить")
                                    .font(.title3)
                                    .foregroundColor(.red)
                                    
                            }
                            .opacity(sharedData.cartProducts.isEmpty ? 0 : 1)

                        }
                        .padding()
                        
                        // checking if liked products are empty...
                        if sharedData.cartProducts.isEmpty{
                            
                            Group{
                                
                                Text("Пусто!")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                
                                Text("Нажмите кнопку «Добавить в Корзину» на каждой странице продукта, чтобы оформить покупку.")
                                    .font(.system(size: 18))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                    .padding(.top,10)
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            // Displaying Products...
                            VStack(spacing: 15){
                                
                                // For Designing...
                                ForEach($sharedData.cartProducts){ $menu in
                                    
                                    HStack(spacing: 0){
                                        
                                        if showDeleteOption{
                                            
                                            Button {
                                                deleteProduct(menu: menu)
                                            } label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }
                                            .padding(.trailing)

                                        }
                                        
                                        CardView(menu: $menu)
                                    }
                                }
                            }
                            .padding(.top,25)
                            .padding(.horizontal)
                        }
                    }
                }
                
                
                // Showing Total and check out Button...
                if !sharedData.cartProducts.isEmpty{
                    
                    Group{
                        
                        HStack{
                            
                            Text("Общая Сумма")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(sharedData.getTotalPrice())
                                .font(.system(size: 18).bold())
                                .foregroundColor(Color("pink"))
                        }
                        .padding(.horizontal, 10)
                        
                        Button {
                            
                        } label: {
                            
                            Text("Оформить Заказ")
                                .font(.system(size: 18).bold())
                                .foregroundColor(.white)
                                .padding(.vertical,18)
                                .frame(maxWidth: .infinity)
                                .background(Color("pink"))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal,25)
                }

                
            }
            .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    struct CardView: View {
        // Making Product as Binding so as to update in Real time...
        @Binding var menu: Category
        
        var body: some View {
        
        HStack(spacing: 15){
            
            Image(menu.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(menu.title)
                    .font(.system(size: 18).bold())
                    .lineLimit(1)
                    .foregroundColor(Color("pink"))

                
                Text(menu.subtitle)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Text("Вид: \(menu.type.rawValue)")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
                // Quantity Buttons...
                HStack(spacing: 10){
                    
                    Text("Количество")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Button {
                        menu.quantity = (menu.quantity > 0 ? (menu.quantity - 1) : 0)
                    } label: {
                        Image(systemName: "minus")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                            .cornerRadius(4)
                    }

                    Text("\(menu.quantity)")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Button {
                        menu.quantity += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                            .cornerRadius(4)
                    }
                }
            }
            

        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(
        
            Color.white
                .cornerRadius(10)
        )
    }
    }
    
    func deleteProduct(menu: Category){
        
        if let index = sharedData.cartProducts.firstIndex(where: { currentMenu in
            return menu.id == currentMenu.id
        }){
            
            let _ = withAnimation{
                // removing...
                sharedData.cartProducts.remove(at: index)
            }
        }
    }
}
struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
    }
}
