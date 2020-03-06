    //
//  TabBar.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    @State private var selection = 0
    
    var body: some View {
        TabView (selection: $selection) {
            HomeView().tabItem {
                selection == 0 ? Image(systemName: "house.fill") : Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            BillView().tabItem {
                selection == 1 ? Image(systemName: "play.circle.fill") : Image(systemName: "play.circle")
                Text("Bills")
            }
            .tag(1)
            MarketplaceView().tabItem {
                selection == 2 ? Image(systemName: "play.circle.fill") : Image(systemName: "play.circle")
                Text("Marketplace")
            }
            .tag(2)
            ProfileView().tabItem {
                selection == 3 ? Image(systemName: "play.circle.fill") : Image(systemName: "play.circle")
                Text("Profile")
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().previewDevice("iPhone 11 Pro Max")
    }
}
