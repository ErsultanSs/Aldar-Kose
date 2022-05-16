//
//  Home.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 23.02.2022.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTY
    var animation: Namespace.ID
    
    // Shared Data...
    @EnvironmentObject var sharedData: SharedDataModel
    
    @StateObject var menuData: MenuViewModel = MenuViewModel()
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Image(systemName: "square.grid.2x2")
                        .font(.title2)
                        .padding(10)
                        .background(Color("pink").opacity(0.12))
                        .foregroundColor(Color("pink"))
                        .cornerRadius(12)
                }
                
                Spacer()
                
                Button {} label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .padding(10)
                        .background(Color("pink").opacity(0.12))
                        .foregroundColor(Color("pink"))
                        .cornerRadius(12)
                }
            } //: HSTACK
            .overlay {
                HStack {
                    Image(systemName: "bolt.car")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("pink"))
                    
                    Text("Алдар - Көсе")
                        .font(.body)
                        .fontWeight(.bold)
                    
                }
            } // MAP + LOC
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading,spacing: 15) {
                    // Top View...
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 10) {
                            (
                                Text("Самая Быстрая ")
                                +
                                Text("Доставка Еды ")
                                    .foregroundColor(Color("pink"))
                                +
                                Text("в Городе")
                            )
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            // Button...
                            Button {} label: {
                                Text("Заказать")
                                    .font(.footnote)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Color("pink"))
                                    .clipShape(Capsule())
                            }
                        } //: VSTACK
                        
                        Spacer(minLength: 0)
                        
                        Image("delivery-man")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getRect().width / 3)
                    } //: HSTACK
                    .padding()
                    .background(Color("lightYellow"))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    // Categories..
                    Text("Пункты Меню")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(CategoryType.allCases, id: \.self) { type in
                                // Category Type View...
                                CategoryTypeView(type: type)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Menu Pages...
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(menuData.filteredProducts) { menu in
                                CategoryMenuView(menu: menu)
                            }
                        }
                        .padding(10)
                    }
                } //: VSTACK
                .padding(.vertical)
            }
            
            
        } //: VSTACK
        // light BG color
        .background(Color.black.opacity(0.03).ignoresSafeArea())
        // Updating data whenever tab changes..
        .onChange(of: menuData.categoryType) { newValue in
            menuData.filterProductByType()
        }
    }
    @ViewBuilder
    func CategoryMenuView(menu: Category) -> some View {
        HStack(spacing: 10) {
            // Adding Matched Geometry Effect...
            ZStack{
                
                if sharedData.showDetailMenu{
                    Image(menu.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }
                else{
                    Image(menu.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(menu.id)IMAGE", in: animation)
                }
            }
                .frame(width: 130, height: 130)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(menu.title)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                
                Text(menu.subtitle)
                    .font(.system(size: 15))
                    .fontWeight(.light)
                
                Text(menu.price)
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 3)
                    .background(Color("pink").opacity(0.9))
                    .clipShape(Capsule())

            }
            .frame(width: getRect().width / 1.7, alignment: .leading)
            
        }
        .onTapGesture {
            
            withAnimation(.easeInOut){
                sharedData.detailMenu = menu
                sharedData.showDetailMenu = true
            }
        }
    }
    
    @ViewBuilder
    func CategoryTypeView(type: CategoryType) -> some View {
        Button {
            withAnimation {
                menuData.categoryType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.system(size: 15))
                .fontWeight(.semibold)
            // changing color based on current product type...
                .foregroundColor(menuData.categoryType == type ? Color.white : Color.black.opacity(0.6))
                .padding(10)
                .background(menuData.categoryType == type ? Color("pink") : Color.gray.opacity(0.18))
                .cornerRadius(15)
                .padding(.horizontal, 4)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Extending View to get screen frame...
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
