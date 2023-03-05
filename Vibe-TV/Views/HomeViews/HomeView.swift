//
//  HomeView.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 05/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
