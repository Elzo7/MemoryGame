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
    
    static var zawartosc:Array<String>=["😎","😁","😢","😂","😡","🤬","🤯","😰"]
    @Published var color:Color = Color.blue
    static func getContent(index:Int) -> String
    {
        if (zawartosc.indices.contains(index))
        {
            return zawartosc[index]
        }
        else
        {
            return "??"
        }
    }
    
    func motiveChanges(motyw:String)
    {
        switch motyw
        {
        case "Motyw 1":
            MemoGameViewModel.zawartosc=["😎","😁","😢","😂","😡","🤬","🤯","😰"]
            color=Color.blue
            model=MemoGameViewModel.createModel()
        case "Motyw 2":
            MemoGameViewModel.zawartosc=["♈️","♉️","♊️","♋️","♌️","♍️","♎️","♏️"]
            color=Color.red
            model=MemoGameViewModel.createModel()
        default:
            MemoGameViewModel.zawartosc=["🇫🇷","🇫🇮","🇹🇩","🇨🇮","🇪🇪","🇳🇮","🇸🇰","🇸🇾"]
            color=Color.green
            model=MemoGameViewModel.createModel()
        }
        
    }
    var cards: Array<MemoGameModel<String>.CardModel>{
        return model.cards
        }
        
        func shuffle(){
            model.cardShuffle()
        }
        
        func choose(card: MemoGameModel<String>.CardModel){
            
            model.chooseCard(card:card)
        }
    
    private static func createModel()->MemoGameModel<String>
    {
        return MemoGameModel<String>(numberOfPairsOfCards: 8, cardContentFactory: getContent)
    }
    @Published
    var model=createModel()
}
