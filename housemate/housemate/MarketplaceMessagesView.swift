//
//  MarketplaceMessagesView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-09.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct MarketplaceMessagesView: View {
    @State var toReply: String = ""
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Image(systemName: "mappin")
                .font(.system(size: 30, weight: .light))
                .imageScale(.medium)
                Text("456 Pear Ave")
                    .font(.largeTitle)
                Spacer()
            }
            .padding(.bottom, 16.0)
            .padding(.top, -32.0)
            HStack(spacing: 8.0) {
                RegularProfilePhotoView()
                RegularProfilePhotoView()
                RegularProfilePhotoView()
                HStack{
                    Text("$500 + ")
                        .fontWeight(.bold)
                        .padding(.leading)
                }
            }
            .padding(.bottom)
            VStack(spacing: 12.0) {
                OtherMessageCardView()
                UserMessageCardView()
                OtherMessageCardView()
                OtherMessageCardView()
                UserMessageCardView()
                Spacer()

                HStack {
                    TextField("Youe message", text: $toReply)
                        .padding(.all)
                    .border(Color.gray, width: 2)
                    Image(systemName: "paperplane")
                    .font(.system(size: 24, weight: .light))
                    .frame(width: 36, height: 36)
                }
                .padding(.top, 58.0)
            }
        }
        .padding(.horizontal)
    }
}

struct MarketplaceMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceMessagesView()
    }
}

struct UserMessageCardView : View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text("fsargeshtsrhsthrthf")
                        .padding([.top, .leading], 12.0)
                        .padding(.bottom, 12.0)
                    Spacer()
                }
            }
            .frame(width: 320.0)
            .border(Color.gray, width: 2)
        }
    }
}

struct OtherMessageCardView : View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    SmallProfilePhotoView()
                    Text("Alice Bob")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(.top, 12.0)
                .padding(.leading, 12.0)
                
                Text("fsargeshtsrhsthrthf")
                    .padding(.leading, 16.0)
                    .padding(.bottom, 12.0)
            }
            .frame(width: 320.0)
            .border(Color.gray, width: 2)
            Spacer()
        }
    }
}
