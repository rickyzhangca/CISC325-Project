//
//  AnnouncementsView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-05.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct AnnouncementsView: View {
    var body: some View {
        ScrollView {
            HStack {
                Text("Annoucements")
                    .font(.largeTitle)
                Spacer()
            }

            VStack (spacing: 8.0) {
                FullAnnouncementCardView()
                FullAnnouncementCardView()
                FullAnnouncementCardView()
            }
            .padding(.trailing, 16.0)
            
            ButtonView(text: "Add Announcement", textColor: Color.blue)
                .padding(.trailing, 12.0)
                .padding(.top, 12.0)
        }
        .padding(.leading, 16.0)
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView()
    }
}

struct FullAnnouncementCardView : View {
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
                .padding(.bottom, 12.0)
            Spacer()
        }
        .border(Color.gray, width: 2)
    }
}
