//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    var viewmodel:MemoGameViewModel
    var body: some View {
        VStack {
            Text("MEMO").font(.largeTitle).padding()
            cardDisplay.animation(.default, value: viewmodel.cards)
            Button("SHUFFLE"){
                viewmodel.shuffle()
                       }
            .foregroundColor(viewmodel.color)
            przyciskiMotywow
        }
        .padding()
    }
    
    var cardDisplay:some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)],spacing: 0){
            ForEach(viewmodel.cards)
            {
                card in CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                                        .padding(4)
                                        .onTapGesture {
                    viewmodel.choose(card: card)
                }
            }
        }.foregroundColor(viewmodel.color)
        
    }
    var przyciskiMotywow:some View
    {
        HStack
        {
            ThemeButton(viewmodel: viewmodel, theme: "Motyw 1", inside: "☺︎", insideText: "Motyw 1")
            Spacer()
            ThemeButton(viewmodel: viewmodel, theme: "Motyw 2", inside: "♋︎", insideText: "Motyw 2")
            Spacer()
            ThemeButton(viewmodel: viewmodel, theme: "Motyw 3", inside: "☭", insideText: "Motyw 3")
        }
    }
     
}

#Preview {
    ContentView(viewmodel:MemoGameViewModel())
}
