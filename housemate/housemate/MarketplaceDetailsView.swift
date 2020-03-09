//
//  MarketplaceDetailsView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-09.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct MarketplaceDetailsView: View {
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
                        Image(systemName: "bolt.circle")
                        .font(.system(size: 30, weight: .light))
                        .imageScale(.medium)
                        .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
                        .frame(height: 36)
                    }
                }
                
                GalleryView()
                    .padding(.top)
                    .padding(.bottom, -16.0)
                
                SectionHeaderView(text: "Description")
                    .padding(.bottom)
                Text("Large bedroom available for sublet May to August 2020. House recenty renovated with updated kitchen, new floors and high ceilings. It's kept very clean throughout the school year and is a great play that stays cool during the summer!")
                
                SectionHeaderView(text: "Details")
                    .padding(.bottom)
                VStack {
                    HStack {
                        Text("Type")
                            .fontWeight(.bold)
                            .padding(.trailing, 24.0)
                        Text("Sublease")
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack {
                        Text("Dates")
                            .fontWeight(.bold)
                            .padding(.trailing, 24.0)
                        Text("May - Aug 2020")
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack {
                        Text("Furnished")
                            .fontWeight(.bold)
                            .padding(.trailing, 24.0)
                        Text("Yes")
                        Spacer()
                    }
                    .padding(.bottom)
                }
                
                Spacer()
                NavigationLink(destination: MarketplaceReplyView()) {
                        ButtonView(text: "Reply", textColor: Color.blue)
                }
        }
        .padding(.leading, 16.0)
        .padding(.trailing, 16.0)
    }
}

struct MarketplaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceDetailsView()
    }
}
}
