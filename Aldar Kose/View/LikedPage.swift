//
//  LikedPage.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 26.02.2022.
//

import SwiftUI

struct LikedPage: View {
    // MARK: - PROPERTY
    @EnvironmentObject var sharedData: SharedDataModel
    
    // Delete Option...
    @State var showDeleteOption: Bool = false
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack{
                        
                        Text("Избранное")
                            .font(.system(size: 28).bold())
                        
                        Spacer()
                        
                        Button {
                            showDeleteOption.toggle()
                        } label: {
                            Text("Удалить")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                        }
                        .opacity(sharedData.likedProducts.isEmpty ? 0 : 1)

                    }
                    .padding()
                    
                    // checking if liked products are empty...
                    if sharedData.likedProducts.isEmpty{
                        
                        Group{
                            
                            Text("Нет Избранных")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                
                            
                            Text("Нажмите кнопку «Нравится» на каждой странице продукта, чтобы сохранить в избранное.")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .padding(.top,10)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal)
                    } else {
                        // Displaying Products...
                        VStack(spacing: 15){
                            
                            // For Designing...
                            ForEach(sharedData.likedProducts){ menu in
                                
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
                                    
                                    CardView(menu: menu)
                                }
                            }
                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    func CardView(menu: Category)->some View{
        
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
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Text("Вид: \(menu.type.rawValue)")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
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
    
    func deleteProduct(menu: Category){
        
        if let index = sharedData.likedProducts.firstIndex(where: { currentMenu in
            return menu.id == currentMenu.id
        }){
            
            let _ = withAnimation{
                // removing...
                sharedData.likedProducts.remove(at: index)
            }
        }
    }
}

struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        LikedPage()
            .environmentObject(SharedDataModel())

    }
}
