//
//  MainPage.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 25.02.2022.
//

import SwiftUI

struct MainPage: View {
    // MARK: - PROPERTY
    @State var currentTab: Tab = .Menu
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    // Animation Namespace...
    @Namespace var animation
    
    // Hiding Tab Bar...
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0){
            
            // Tab View...
            TabView(selection: $currentTab) {
                
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Menu)
                
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Favourite)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
                CartPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            }
            
            // Custom Tab Bar...
            HStack(spacing: 0){
                ForEach(Tab.allCases,id: \.self){tab in
                    
                    Button {
                        // updating tab...
                        currentTab = tab
                    } label: {
                     
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("pink") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.top])
            .padding(.bottom,10)
        }
        .background(Color.black.opacity(0.03).ignoresSafeArea())
        .overlay(
        
            ZStack{
                // Detail Page...
                if let menu = sharedData.detailMenu,sharedData.showDetailMenu {
                    
                    MenuDetailView(menu: menu, animation: animation)
                        .environmentObject(sharedData)
                    // adding transitions...
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
                
            }
        )

    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Tab Cases...
enum Tab: String, CaseIterable {
    case Menu = "menucard"
    case Favourite = "heart"
    case Profile = "person"
    case Cart = "cart"
}
