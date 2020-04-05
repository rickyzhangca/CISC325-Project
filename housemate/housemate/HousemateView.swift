//
//  HousemateView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-06.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct HousemateView: View {
    
    @State var name: String = ""
    @State var icon: String = "person"
    
    var body: some View {
        ScrollView {
            VStack {
                ProfilePersonView(name:self.name, icon:self.icon)
                List {
                    HStack {
                        Image(systemName: "phone")  .font(.system(size: 24.0))
                        Text("123-456-7890")
                    }
                }.frame(height: 50.0)
            }
        }
    }
}

struct HousemateView_Previews: PreviewProvider {
    static var previews: some View {
        HousemateView()
    }
}
