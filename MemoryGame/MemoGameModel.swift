//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent>
{   private (set)var cards: Array<CardModel>
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent)
    {
        cards = []
        for i in (0..<numberOfPairsOfCards)
        {
            cards.append(CardModel(id:String(i)+"a",inside: cardContentFactory(i)))
            cards.append(CardModel(id:String(i)+"b",inside: cardContentFactory(i)))
        }
    }
    mutating func chooseCard(card:CardModel)
    {
        let index = cards.firstIndex(where: {$0.id == card.id})!
        cards[index].reversed.toggle()
    }
    mutating func cardShuffle()
    {
        cards.shuffle()
    }
    struct CardModel: Identifiable
    {
        var id:String
        var reversed:Bool = false
        var matching:Bool = false
        var inside: CardContent
    }
}
