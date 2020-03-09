//
//  UsefulViews.swift
//  housemate
//
//  Created by Ricky Zhang on 2020-03-09.
//  Copyright © 2020 CISC325 Group 10. All rights reserved.
//

import SwiftUI

struct UsefulViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UsefulViews_Previews: PreviewProvider {
    static var previews: some View {
        UsefulViews()
    }
}

struct ButtonView: View {
    @State var text:String = "button";
    @State var textColor:Color = Color.black;
    @State var borderColor:Color = Color.blue;
    var body: some View {
        HStack {
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(self.text)
            }
            Spacer()
        }
        .foregroundColor(self.textColor)
        .padding(.vertical, 16.0)
        .background(Color.white)
        .border(self.borderColor, width: 2)
        .cornerRadius(12.0, antialiased: true)
        .padding(.bottom, 12.0)
    }
}

struct ProfileButtonView : View {
    var body: some View {
        NavigationLink(destination: HousemateView()) {
            VStack {
                Image(systemName: "person.circle.fill")
                .font(.system(size: 42, weight: .light))
                .imageScale(.medium)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
                .frame(width: 52, height: 48)
                Text("Alice Bob")
            }
        }.foregroundColor(Color.black)
    }
}
struct RegularProfilePhotoView : View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
            .font(.system(size: 42, weight: .light))
            .imageScale(.medium)
            .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            .frame(width: 42, height: 42)
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
            .frame(width: 36, height: 36)
        }
    }
}

struct GalleryView: View {
    var body: some View {
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
    }
}

struct SectionHeaderWithLinkView : View {
    @State var text:String = "Section Header";
    @State var seeAll:Bool = false;
    @State var leading:CGFloat = 0.0;
    var view: AnyView;
    
    var body: some View {
        HStack() {
            Text(self.text)
                .font(.headline)
            .multilineTextAlignment(.leading)
            
            Spacer()
            
            
            NavigationLink(destination: view) {
                Text("See All")
                .foregroundColor(.blue)
            }
        }
        .padding(.leading, self.leading)
        .padding(.trailing, 16.0)
        .padding(.top, 32.0)
    }
}

struct SectionHeaderView : View {
    @State var text:String = "Section Header";
    @State var seeAll:Bool = false;
    @State var leading:CGFloat = 0.0;
    
    var body: some View {
        HStack() {
            Text(self.text)
                .font(.headline)
            .multilineTextAlignment(.leading)
            .padding(.top, 32.0)
            
            Spacer()
        }
        .padding(.leading, self.leading)
    }
}
