//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation
import SwiftUI
class MemoGameViewModel:ObservableObject
{
    var zawartosc:Array<String>=["😎","😁","😢","😂","😡","🤬","🤯","😰"]
    var color:Color = Color.blue
    func getContent(index:Int) -> String
    {
        if(index>=zawartosc.count)
        {
            return "??"
        }
        else{
            return zawartosc[index]
        }
    }
    func motiveChanges(emotes:Array<String>,themeColor:Color,ins:String,insText:String)->some View
    {
        return ThemeButton(inside: .constant(ins), insideText: .constant(insText)).foregroundColor(themeColor).onTapGesture {
            self.color=themeColor
            self.zawartosc=emotes.shuffled()
        }
    }
    var motives:some View
    {
        HStack{
            motiveChanges(emotes: ["😎","😁","😢","😂","😡","🤬","🤯","😰"], themeColor: .blue, ins: "☀︎", insText: "Motyw 1")
            Spacer()
            motiveChanges(emotes: ["🍌","🍒","🍋","🍑","🍉","🥥","🫐","🍍"], themeColor: .red, ins: "☕︎", insText: "Motyw 2")
            Spacer()
            motiveChanges(emotes: ["♈️","♋️","♌️","♏️","♎️","♑️","♐️","⚛️"], themeColor: .green, ins: "♈︎", insText: "Motyw 3")
        }
    }
    func createModel()->some View
    {
        VStack{
            
            motives
        }
    }
    @Published
    var model:some View
    {
       createModel()
    }
}
