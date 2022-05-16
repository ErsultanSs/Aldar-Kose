//
//  MenuDetailView.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 26.02.2022.
//

import SwiftUI

struct MenuDetailView: View {
    // MARK: - PROPERTY
    var menu: Category
    @EnvironmentObject var sharedData: SharedDataModel
    @EnvironmentObject var homeData: MenuViewModel
    
    // For Matched Geometry Effect...
    var animation: Namespace.ID
    // MARK: - BODY
    var body: some View {
        VStack {
            // Title Bar and Menu Image...
            VStack {
                HStack {
                    Button {
                        // closing view
                        withAnimation(.easeInOut) {
                            sharedData.showDetailMenu = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Button {
                        addToLiked()
                    } label: {
                        Image(systemName: isLiked() ? "heart.fill" : "heart")
                            .font(.title2)
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
                .padding()
                
                // Menu Image...
                // Adding Matched Geometry Effect...
                Image(menu.productImage)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "\(menu.id)IMAGE", in: animation)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight: .infinity )
                
            }
            .frame(height: getRect().height / 2.7)
            .zIndex(1)
            
            // Menu Details...
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading,spacing: 15) {
                    Text(menu.title)
                        .font(.system(size: 24).bold())
                    
                    Text(menu.subtitle)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Цена")
                            .font(.system(size: 20).bold())
                        
                        Spacer()
                        
                        Text("\(menu.price)")
                            .font(.system(size: 20).bold())
                            .foregroundColor(Color("pink"))
                    }
                    .padding(.vertical,20)
                    
                    // Add button...
                    Button {
                        addToCart()
                    } label: {
                        Text("\(isAddedToCart() ? "Добавлено" : "Добавить") в Корзину")
                            .font(.system(size: 20).bold())
                            .foregroundColor(.white)
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .background(
                            
                                Color("pink")
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                            )
                    }
                }
                .padding([.horizontal,.bottom],20)
                .padding(.top,25)
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                // Corner radius for only top side...
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
            .zIndex(0)
        }
        .background(Color("HomeBG").ignoresSafeArea())
        
    }
    func isLiked()->Bool{
        
        return sharedData.likedProducts.contains { menu in
            return self.menu.id == menu.id
        }
    }
    
    func isAddedToCart()->Bool{
        
        return sharedData.cartProducts.contains { menu in
            return self.menu.id == menu.id
        }
    }
    
    func addToLiked(){
        
        if let index = sharedData.likedProducts.firstIndex(where: { menu in
            return self.menu.id == menu.id
        }){
            // Remove from liked....
            sharedData.likedProducts.remove(at: index)
        }
        else{
            // add to liked
            sharedData.likedProducts.append(menu)
        }
    }
    
    func addToCart(){
        
        if let index = sharedData.cartProducts.firstIndex(where: { menu in
            return self.menu.id == menu.id
        }){
            // Remove from liked....
            sharedData.cartProducts.remove(at: index)
        }
        else{
            // add to liked
            sharedData.cartProducts.append(menu)
        }
    }
}



struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        MenuDetailView(menu: MenuViewModel().categories[0])
//            .environmentObject(SharedDataModel())
        
        MainPage()
        
    }
}
