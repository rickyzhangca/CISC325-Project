//
//  AnnouncementsView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-05.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct AnnouncementsView: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var toadd: String = ""
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Annoucements")
                    .font(.largeTitle)
                Spacer()
            }

            VStack (spacing: 8.0) {
                ForEach(0..<truth.Data_Announcements.count) { i in
                    if self.truth.Data_Announcements[i].check_status == false {
                        FullAnnouncementCardView(text: self.truth.Data_Announcements[i].text, made_by: self.truth.Data_Announcements[i].made_by, announcement_id: i, icon: self.truth.Data_Announcements[i].icon)
                        .frame(height: 160.0)
                    }
                }
            }
            .padding(.trailing, 16.0)
            
            VStack {
                VStack {
                    TextField("New Announcement", text: $toadd)
                    .padding(.all, 16.0)
                    .border(Color.gray, width: 2)
                }
                .padding([.top, .trailing], 16.0)
                
                Button(
                    action:{
                        if self.toadd != "" {
                            self.truth.CreateNewAnnouncement(t: self.toadd, c: false, m:self.truth.Data_Housemates[0].name, i:self.truth.Data_Housemates[0].icon)
                            self.toadd = ""
                        }
                })
                {
                    Text("Add New Announcement")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .padding([.leading, .bottom], 0.0)
                .padding(.trailing, 16.0)
                .buttonStyle(MyButtonStyle(color: Color(UIColor(rgb:0x523DCE))))
            }
            .padding(.bottom, 16.0)
            
            VStack (spacing: 8.0) {
                ForEach(0..<truth.Data_Announcements.count) { i in
                    if self.truth.Data_Announcements[i].check_status == true {
                        FullAnnouncementCardView(text: self.truth.Data_Announcements[i].text, made_by: self.truth.Data_Announcements[i].made_by, announcement_id: i, icon: self.truth.Data_Announcements[i].icon)
                        .frame(height: 160.0)
                    }
                }
            }
            .padding(.trailing, 16.0)
        }
        .padding(.leading, 16.0)
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView().environmentObject(SourceOfTruth())
    }
}

struct FullAnnouncementCardView : View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var text:String = "aaa";
    @State var made_by:String = "Alice Bob";
    @State var announcement_id:Int = 1;
    @State var icon:String = "person";
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                SmallProfilePhotoView(icon:self.icon)
                    .padding(.top, 12.0)
                    .padding([.leading, .bottom], 6.0)
                Text(self.made_by)
                Spacer()
                Button(action:{
                    self.truth.Data_Announcements[self.announcement_id].check_status.toggle()
                }) {
                    if self.truth.Data_Announcements[self.announcement_id].check_status == true
                    {
                        Image(systemName: "eye.slash")
                            .padding(.trailing)
                        .font(.system(size: 17, weight: .light))
                        .foregroundColor(Color.gray)
                    }
                    else {
                        Image(systemName: "eye")
                            .padding(.trailing)
                        .font(.system(size: 17, weight: .light))
                        .foregroundColor(Color(UIColor(rgb:0x523DCE)))
                    }
                }
            }
            Text(self.text)
                .padding(.leading, 12.0)
                .padding(.bottom, 12.0)
            Spacer()
        }
        .border(Color.gray, width: 2)
    }
}
