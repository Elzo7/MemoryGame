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
    func motiveChanges (emotes:Array<String>,themeColor:Color,ins:String,insText:String)->some View
    {
        return ThemeButton(inside: .constant(ins), insideText: .constant(insText)).foregroundColor(themeColor).onTapGesture {
            color=themeColor
            emotki=emotes.shuffled()
        }
    }
    var motive1:some View
    {
        motiveChanges(emotes: ["😎","😁","😢","😂","😡","🤬","🤯","😰"], themeColor: .blue, ins: "☀︎", insText: "Motyw 1")
    }
    var motive2:some View
    {
        motiveChanges(emotes: ["🍌","🍒","🍋","🍑","🍉","🥥","🫐","🍍"], themeColor: .red, ins: "☕︎", insText: "Motyw 2")
    }
    var motive3:some View
    {
        motiveChanges(emotes: ["♈️","♋️","♌️","♏️","♎️","♑️","♐️","⚛️"], themeColor: .green, ins: "♈︎", insText: "Motyw 3")
    }
    var cardAdder:some View{
        adjustCardNumber(by_offset: 2, symbol: "+")
    }
    var cardDeleter:some View{
        adjustCardNumber(by_offset: -2, symbol: "-")
    }
    var cardDisplay:some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            ForEach(0 ..< card_number,id: \.self)
            {
                index in CardView(inside: $emotki[index],themeColor: $color).aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.blue)
        
    }
    @State var color:Color = Color.red
    @State var emotki:Array<String> = ["😎","😁","😢","😂","😡","🤬","🤯","😰"]
    @State var card_number:Int=4
    var body: some View {
        VStack {
            Text("MEMO").font(.largeTitle).padding()
            cardDisplay
            Spacer()
            HStack
            {
               // cardAdder
                Spacer()
               // cardDeleter
            }
            HStack{
                motive1
                Spacer()
                motive2
                Spacer()
                motive3
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
