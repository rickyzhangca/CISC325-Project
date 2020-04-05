//
//  HomeView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("H O U S E M A T E S")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(rgb:0x523DCE)))
                        .padding(.bottom)
                    Text(self.truth.Data_House.address)
                        .font(.largeTitle)
                    HStack (spacing: 24.0) {
                        ForEach(self.truth.Data_Housemates) { h in
                            ProfileButtonView(name:h.name)
                        }
                    }
                }
                .padding(.bottom, 16.0)
                
                SectionHeaderWithLinkView(text: "Announcements", seeAll: true, leading: 16.0, view: AnyView(AnnouncementsView()))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(self.truth.Data_Announcements) { a in
                            AnnouncementCardView(text: a.text)
                            .padding(.leading, 12.0)
                        }
                    }
                    .padding(.trailing)
                }
                
                SectionHeaderWithLinkView(text: "House Tasks", seeAll: true, leading: 16.0, view: AnyView(TasksView()))
                
                VStack {
                    ForEach(0..<truth.Data_Tasks.count) { i in
                        if self.truth.Data_Tasks[i].checkState == false {
                            HouseTaskView(checkState: self.truth.Data_Tasks[i].checkState, task: self.truth.Data_Tasks[i].name, num_users: self.truth.Data_Tasks[i].num_users, task_id: i)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(SourceOfTruth())
    }
}

struct AnnouncementCardView : View {
    @State var text:String = "aaa";
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                SmallProfilePhotoView()
                    .padding(.top, 12.0)
                    .padding([.leading, .bottom], 6.0)
                Spacer()
            }
            Text(self.text)
                .padding(.leading, 12.0)
            Spacer()
        }
        .frame(width: 260, height: 170)
        .background(Color(#colorLiteral(red: 0.9345341325, green: 0.9346905947, blue: 0.9345135093, alpha: 1)))
    }
}

struct HouseTaskView : View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var checkState:Bool = false;
    @State var task:String = "to do";
    @State var num_users:Int = 1;
    @State var task_id:Int = 1;
    
    var body: some View {
        Button(action:
            {
                self.checkState = !self.checkState
                self.truth.Data_Tasks[self.task_id].checkState.toggle()
            }
         )
         {
            HStack(spacing: 12) {
                checkState == true ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                Text(self.task)
                
                Spacer()
                
                HStack {
                    ForEach(0 ..< self.num_users) {_ in
                        SmallProfilePhotoView()
                            .padding(.leading, -12.0)
                    }
                }
            }
        }
        .foregroundColor(Color.black)
    }
}
