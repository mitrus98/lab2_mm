//
//  ChangeViewButton.swift
//  lab2_mm
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ChangeViewButton: View {
    var nameImage = ""
    var text = ""
    var oNumber = 0
    var oColor = Color.blue
    @Binding var tColor : Color
    @Binding var tNumer : Int
    var body: some View {
        Button(action: {
            tNumer = oNumber
            tColor = oColor
        }, label: {
            VStack{
                Image(systemName: nameImage).font(.title)
                Text(text)
            }
        })
    }
}

//#Preview {
//    ChangeViewButton()
//}
