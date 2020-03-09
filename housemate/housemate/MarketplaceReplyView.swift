//
//  MarketplaceReplyView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-09.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct MarketplaceReplyView: View {
    @State var toReply: String = ""
    var body: some View {
        NavigationView {
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
                VStack {
                    TextField("Hi! I saw your post and I'd like to inquire about the room you have available.", text: $toReply)
                            .padding(12.0)
                            .frame(height: 360.0)
                            .border(Color.gray, width: 2)
                    
                        Spacer()
                        NavigationLink(destination: MarketplaceReplyView()) {
                                ButtonView(text: "Reply", textColor: Color.blue)
                        }
                }
                .padding([.top, .leading, .trailing], 12.0)
            }
        }
    }
}

struct MarketplaceReplyView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceReplyView()
    }
}
