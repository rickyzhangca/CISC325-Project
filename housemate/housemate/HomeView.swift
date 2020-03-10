//
//  HomeView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("123 Paris Hill St")
                        .font(.largeTitle)
                    HStack (spacing: 24.0) {
                        ProfileButtonView(name:"Alice Bob")
                        ProfileButtonView(name: "Celine David")
                        ProfileButtonView(name: "Ella Field")
                    }
                }
                .padding(.bottom, 16.0)
                
                SectionHeaderWithLinkView(text: "Announcements", seeAll: true, leading: 16.0, view: AnyView(AnnouncementsView()))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        AnnouncementCardView(announcement: "Welcome to 123 Paris Hill st everyone!")
                            .padding(.leading, 16.0)
                        AnnouncementCardView(announcement: "The landlord told us to tranfer the rent at the beginning of each month so I've set it up in the bill tab!")
                            .padding(.trailing, 16.0)
                    }
                }
                
                SectionHeaderWithLinkView(text: "House Tasks", seeAll: true, leading: 16.0, view: AnyView(TasksView()))
                
                VStack {
                    HouseTaskView(checkState: false, task: "Sweep floors")
                    HouseTaskView(checkState: false, task: "Take out garbage")
                    HouseTaskView(checkState: false, task: "Clean up the mess Lee made")
                }
                .padding(.leading, 16.0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AnnouncementCardView : View {
    @State var announcement:String = "aaa";
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                SmallProfilePhotoView()
                    .padding(.top, 12.0)
                    .padding([.leading, .bottom], 6.0)
                Spacer()
            }
            Text(self.announcement)
                .padding(.leading, 12.0)
            Spacer()
        }
        .frame(width: 260, height: 170)
        .background(Color(#colorLiteral(red: 0.9345341325, green: 0.9346905947, blue: 0.9345135093, alpha: 1)))
    }
}

struct HouseTaskView : View {
    @State var checkState:Bool = false;
    @State var task:String = "to do";
    var body: some View {
        Button(action:
            {
                self.checkState = !self.checkState
                print("State : \(self.checkState)")
            }
         )
         {
            HStack(spacing: 12) {
                checkState == true ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                Text(self.task)
                Spacer()
                SmallProfilePhotoView()
                    .padding(.trailing, -12.0)
                SmallProfilePhotoView()
                    .padding(.trailing, 16.0)
            }
        }
        .foregroundColor(Color.black)
    }
}
