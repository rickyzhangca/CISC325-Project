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
