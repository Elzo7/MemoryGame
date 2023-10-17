//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    func adjustCardNumber(by_offset: Int, symbol: String) -> some View
    {
        return Button(symbol)
        {
                if(by_offset+card_number >= 2 && by_offset+card_number <= 8)
                {
                    card_number+=by_offset
                }
        }.frame(width: 20,height: 20).border(.blue)
    }
    var cardAdder:some View{
        adjustCardNumber(by_offset: 2, symbol: "+")
    }
    var cardDeleter:some View{
        adjustCardNumber(by_offset: -2, symbol: "-")
    }
    var cardDisplay:some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0 ..< card_number,id: \.self)
            {
                index in CardView(inside: $emotki[index]).aspectRatio(4/1, contentMode: .fit)
            }
        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
    }
    @State var emotki:Array<String> = ["😎","😁","😢","😂","😡","🤬","🤯","😰"]
    @State var card_number:Int=0
    var body: some View {
        VStack {
            cardDisplay
            Spacer()
            HStack
            {
                cardAdder
                Spacer()
                cardDeleter
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
