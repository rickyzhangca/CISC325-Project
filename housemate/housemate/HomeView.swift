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
        ScrollView {
            VStack {
                Text("123 Paris Hill St")
                    .font(.largeTitle)
                    .padding(.top, 32.0)
                HStack (spacing: 24) {
                    ProfileButtonView()
                    ProfileButtonView()
                    ProfileButtonView()
                }
            }
            
            SectionHeaderView(text: "Announcements")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    AnnouncementCardView()
                    AnnouncementCardView()
                }
            }
            
            SectionHeaderView(text: "House Tasks")
            
            VStack {
                HouseTaskView(checkState: false)
                HouseTaskView(checkState: false)
                HouseTaskView(checkState: false)
                HouseTaskView(checkState: false)
            }
        }
        .padding(.leading, 16.0)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct SectionHeaderView : View {
    @State var text:String = "Section Header";
    var body: some View {
        HStack() {
            Text(self.text)
                .font(.headline)
            .multilineTextAlignment(.leading)
            .padding(.top, 32.0)
            
            Spacer()
        }
    }
}

struct ProfileButtonView : View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
            .font(.system(size: 42, weight: .light))
            .imageScale(.medium)
            .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            .frame(width: 52, height: 48)
            Text("Alice Bob")
        }
    }
}
struct SmallProfilePhotoView : View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
            .font(.system(size: 30, weight: .light))
            .imageScale(.medium)
            .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            .frame(width: 42, height: 36)
        }
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
        .background(Color.blue)
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
                checkState == true ? Image(systemName: "checkmark.circle") : Image(systemName: "circle")
                Text("Todo  item ")
                Spacer()
                SmallProfilePhotoView()
                    .padding(.trailing, 16.0)
            }
        }
        .foregroundColor(Color.black)
    }
}
