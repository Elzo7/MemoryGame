//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct CardView: View {
    
    var card : MemoGameModel<String>.CardModel
    init(card: MemoGameModel<String>.CardModel) {
        self.card = card
    }
    var body: some View {
        HStack
        {
                ZStack
                {
                    let CardBack = RoundedRectangle(cornerRadius: 12)

                    Group
                    {
                        CardBack.fill(.white)
                        CardBack.stroke( .blue,lineWidth: 2)
                        Text(card.inside).font(.system(size: 200))
                            .minimumScaleFactor(0.01)
                            .aspectRatio(1, contentMode: .fit)
                       
                   
                    }
                    .opacity(card.reversed ? 1 : 0) 
                    CardBack.fill().opacity(card.reversed ? 0 : 1)
                }
            }
        }
    }

#Preview {
    CardView(card: MemoGameModel<String>.CardModel(id: "1", inside: "Test"))
}
