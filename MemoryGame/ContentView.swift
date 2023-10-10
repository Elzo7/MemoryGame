//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {

    func adjustCardNumber(by offset: Int, symbol: String) -> some View
    {
        if(offset<0)
        {
            
        }
        else
        {
            
        }
    }
    var karty:Array<any View>
    let emotki:Array<String> = ["😎","😁","😢","😂","😡","🤬","🤯","😰"]
    @State var card_number:Int=0
    var body: some View {
        VStack {
            HStack
            {
                Button("+"){
                    if(card_number<emotki.count)
                    {
                        //cos
                    }
                }.frame(width: 20,height: 20).border(.blue)
                Button("-"){
                    if(card_number>2)
                    {
                      //cos
                    }
                }.frame(width: 20,height: 20).border(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
