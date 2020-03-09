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
        NavigationView {
            ScrollView {
                VStack {
                    Text("123 Paris Hill St")
                        .font(.largeTitle)
                        .padding(.top, -32.0)
                    HStack (spacing: 24) {
                        ProfileButtonView()
                        ProfileButtonView()
                        ProfileButtonView()
                    }
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
            HStack {
                VStack {
                    Image(systemName: "photo")
                    .font(.system(size: 30, weight: .light))
                    .imageScale(.medium)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .frame(height: 36)
                }
                .frame(width: 200, height: 160)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .border(Color.white, width: 2)
                
                VStack {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                            .font(.system(size: 30, weight: .light))
                            .imageScale(.medium)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .frame(height: 36)
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .border(Color.white, width: 2)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                            .font(.system(size: 30, weight: .light))
                            .imageScale(.medium)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .frame(height: 36)
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .border(Color.white, width: 2)
                }
            }
            HStack {
                Text("Large bedroom available for sublet May to August 2020. House recenty renovated with updated kitchen, new floo...")
                    .font(.callout)
                    .padding(.top, 8.0)
                Spacer()
            }
            HStack {
                Spacer()
                NavigationLink(destination: NewSplitBillView()) {
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
