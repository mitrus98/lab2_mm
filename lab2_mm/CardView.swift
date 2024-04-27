//
//  CardView.swift
//  lab2_mm
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)

    init(content: String, isFaceUp: Bool){
        self.content = content
        self.isFaceUp = isFaceUp
    }
    
    var body: some View {
        ZStack{
            Group{
                base.fill(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))

                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)

            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
