//
//  ProfilePage.swift
//  Aldar Kose
//
//  Created by Ерсултан Сабырханов on 01.03.2022.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        VStack(spacing: 15) {
            
            Image("Profile-Image")
                .resizable()
                .scaledToFit()
                .padding()
                .padding(.bottom)
            
            Text("Регистрируйтесь и Заказывайте!")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("""
                 В приложении Aldar-Kose есть идеальные варианты как для делового обеда или большой тусовки, так и для семейного ужина или романтического вечера.
                 """)
                .font(.callout)
                .padding(.horizontal, 10)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Button {} label: {
                Text("Указать Телефон".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("pink"))
                    .clipShape(Capsule())
                    .offset(y: 30)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
