//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent>
{   var cards: Array<CardModel>
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent)
    {
        cards = []
        for i in (0..<numberOfPairsOfCards)
        {
            cards.append(CardModel(inside: cardContentFactory(i)))
            cards.append(CardModel(inside: cardContentFactory(i)))
        }
    }
    func chooseCard(card:CardModel)
    {
       //card.reverseCard()
    }
    struct CardModel
    {
        public var reversed:Bool = false
        public var matching:Bool = false
        public var inside: CardContent
        init(inside:CardContent)
        {
            self.inside = inside
        }
        mutating func reverseCard()
        {
            self.reversed=true
        }
    }
}
