//
//  MarketplaceView.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-02.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct MarketplaceView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Kingston, ON")
                    .font(.largeTitle)
                    .padding(.top, -32.0)
            }
            .padding(.bottom, 32.0)
            
            HStack {
                NavigationLink(destination: NewSplitBillView()) {
                    ButtonView(text: "Filters", textColor: Color.blue, borderColor: Color.white)
                }.foregroundColor(Color.black)

                NavigationLink(destination: NewSplitBillView()) {
                    ButtonView(text: "Post a Room", textColor: Color.blue, borderColor: Color.white)
                }.foregroundColor(Color.black)

                NavigationLink(destination: NewSplitBillView()) {
                    ButtonView(text: "Messasges", textColor: Color.blue, borderColor: Color.white)
                }.foregroundColor(Color.black)
            }
            
            MarketplaceCardView()
            MarketplaceCardView()
            MarketplaceCardView()
            MarketplaceCardView()
        }.padding(.horizontal, 12.0)
    }
}

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView()
    }
}

struct MarketplaceCardView: View {
    var body: some View {
        VStack {
            HStack {
                HStack{
                    SmallProfilePhotoView()
                    Image(systemName: "2.square")
                    .font(.system(size: 30, weight: .light))
                    .imageScale(.medium)
                    .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
                        .frame(width: 8.0, height: 36)
                    Text("456 Pear Ave")
                        .padding(.leading)
                }
                Spacer()
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
            HStack {
                Text("SUBLET: May 2020 - August 2020")
                    .font(.headline)
                    .padding(.vertical, 8.0)
                Spacer()
            }
            
            GalleryView()
            
            HStack {
                Text("Large bedroom available for sublet May to August 2020. House recenty renovated with updated kitchen, new floo...")
                    .font(.callout)
                    .padding(.top, 8.0)
                Spacer()
            }
            HStack {
                Spacer()
                NavigationLink(destination: MarketplaceDetailsView()) {
                    Text("See more")
                        .foregroundColor(Color.blue)
                }
            }
        }
        .padding(.all)
        .border(Color.gray, width: 2)
        .cornerRadius(12.0, antialiased: true)
    }
}
