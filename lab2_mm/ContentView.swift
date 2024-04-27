//
//  ContentView.swift
//  lab2_mm
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var tNumer = 1
    @State var tColor = Color.blue
    let emojis1 = ["😀","😇","😄","🤣","🤪","😎","😭","😤","🤠","🤢","👿","😷","😅","🐣"]
    let emojis2 = ["💀","👻","👽","😸","👾","👹","🤡","🤖","🎃","👄","🦷","👅","🫁","👤","🫂","👁️","🦿","✍️","💩","👖"]
    let emojis3 = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐒","🐔","🐦","🐣","🦆","🐝","🪱"]
    @State var numberCard = 4
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            viewCard
            HStack{
                removeCard
                Spacer()
                addCard
            }
        }
        .padding()
    }
    
    var viewCard: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]){
                ForEach(0..<cardChooser().1, id: \.self){
                    index in CardView(content: cardChooser().0[index], isFaceUp: false).aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(tColor)
            .padding()
        }
        
    }
    
    func cardChooser() -> (Array<String>, Int) {
        if(tNumer == 1){
            return (emojis1.shuffled(), emojis1.count)
        }
        if(tNumer == 2){
            return (emojis2.shuffled(), emojis2.count)
        }else{
            return (emojis3.shuffled(), emojis3.count)
        }
        
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            numberCard += offset
        } , label: {
        Image(systemName: symbol)
            .font(.largeTitle)
        })
        .disabled(numberCard + offset < 2 || numberCard + offset > cardChooser().0.count)
    }

    var addCard: some View{
        return adjustCardNumber(by: 2, symbol: "plus")
    }
    
    var removeCard: some View{
        return adjustCardNumber(by: -2, symbol: "minus")
    }
}


#Preview {
    ContentView()
}
