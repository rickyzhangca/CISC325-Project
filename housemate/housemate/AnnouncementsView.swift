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
                ForEach(truth.Data_Announcements) { a in
                    FullAnnouncementCardView(text: a.text)
                    .frame(height: 160.0)
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
                            self.truth.CreateNewAnnouncement(t: self.toadd)
                            self.toadd = ""
                        }
                })
                {
                    Text("Add New Announcement")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .padding([.leading, .bottom], 0.0)
                .padding(.trailing, 16.0)
                .buttonStyle(MyButtonStyle(color: .blue))
            }
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
                .padding(.bottom, 12.0)
            Spacer()
        }
        .border(Color.gray, width: 2)
    }
}
