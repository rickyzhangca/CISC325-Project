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
                        .padding(.top, -32.0)
                    HStack (spacing: 24.0) {
                        ProfileButtonView()
                        ProfileButtonView()
                        ProfileButtonView()
                    }
                }
                .padding(.bottom, 16.0)
                
                SectionHeaderWithLinkView(text: "Announcements", seeAll: true, leading: 16.0, view: AnyView(AnnouncementsView()))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        AnnouncementCardView()
                            .padding(.leading, 16.0)
                        AnnouncementCardView()
                            .padding(.trailing, 16.0)
                    }
                }
                
                SectionHeaderWithLinkView(text: "House Tasks", seeAll: true, leading: 16.0, view: AnyView(TasksView()))
                
                VStack {
                    HouseTaskView(checkState: false)
                    HouseTaskView(checkState: false)
                    HouseTaskView(checkState: false)
                    HouseTaskView(checkState: false)
                }
                .padding(.leading, 16.0)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AnnouncementCardView : View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                SmallProfilePhotoView()
                    .padding(.top, 12.0)
                    .padding([.leading, .bottom], 6.0)
                Spacer()
            }
            Text("fsargeshtsrhsthrthf")
                .padding(.leading, 12.0)
            Spacer()
        }
        .frame(width: 260, height: 160)
        .background(Color(#colorLiteral(red: 0.9345341325, green: 0.9346905947, blue: 0.9345135093, alpha: 1)))
    }
}

struct HouseTaskView : View {
    @State var checkState:Bool = false;
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
                Text("Todo  item ")
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
