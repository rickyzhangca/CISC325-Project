    //
//  TabBar.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var tasks: [Task] = []
    var announcements: [Announcement] = []
    var house: House = House(address: "temp")
    
    @State private var selection = 0
    
    var body: some View {
        TabView (selection: $selection) {
            HomeView().tabItem {
                selection == 0 ? Image(systemName: "house.fill") : Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            BillView().tabItem {
                selection == 1 ? Image(systemName: "doc.text.fill") : Image(systemName: "doc.text")
                Text("Bills")
            }
            .tag(1)
            MarketplaceView().tabItem {
                selection == 2 ? Image(systemName: "bed.double.fill") : Image(systemName: "bed.double")
                Text("Marketplace")
            }
            .tag(2)
            ProfileView().tabItem {
                selection == 3 ? Image(systemName: "person.fill") : Image(systemName: "person")
                Text("Profile")
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().previewDevice("iPhone 11 Pro Max").environmentObject(SourceOfTruth())
    }
}
