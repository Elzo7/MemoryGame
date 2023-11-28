//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent:Equatable
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
        if cards[index].matching == false
        {
            if let potentialMatch=indexOfOneAndOnlyFaceUpCard
            {
                if cards[index].inside == cards[potentialMatch].inside
                {
                    cards[index].matching = true
                    cards[potentialMatch].matching = true
                }
            }
            else
            {
                indexOfOneAndOnlyFaceUpCard=index
            }
            cards[index].reversed = true
        }
    }
    mutating func cardShuffle()
    {
        cards.shuffle()
    }
    var indexOfOneAndOnlyFaceUpCard: Int?
    {
        get {
            if cards.filter({$0.reversed==true}).indices.count == 1{
                return cards.filter{$0.reversed == true}.indices[0]
            }
            else
            {
                return nil
            }
        }
        set {cards.indices.forEach({cards[$0].reversed = $0 == newValue})}
    }
    struct CardModel: Identifiable,Equatable
    {
        var id:String
        var reversed:Bool = false
        var matching:Bool = false
        var inside: CardContent
    }
}
