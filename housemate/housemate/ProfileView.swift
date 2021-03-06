//
//  ProfileView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var name: String = ""
    @State var icon: String = ""
    
    var body: some View {
        VStack {
            VStack {
                ProfilePersonView(name: self.truth.Data_Housemates[0].name, icon: self.truth.Data_Housemates[0].icon)
            }
            
            List {
                Text("Account")
                Text("Notification")
                Text("Accessibility")
                Text("About")
            }.frame(height: 180.0)
            
            Spacer()
        }
        .padding(.leading, 4.0)
        .padding(.trailing, 16.0)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(SourceOfTruth())
    }
}

struct ProfilePersonView: View {
    
    @State var name:String = "Alice Bob";
    @State var icon:String = "person";
    
    var body: some View {
        VStack {
            Image(systemName: self.icon)
            .font(.system(size: 100, weight: .light))
            .imageScale(.medium)
            .foregroundColor(Color(UIColor(rgb:0x523DCE)))
            .frame(width: 120, height: 100)
            .padding(.top, 32.0)
            
            Text(self.name)
                .font(.title)
        }
    }
}
