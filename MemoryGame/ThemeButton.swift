//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    @ObservedObject
    var viewmodel:MemoGameViewModel
    let theme:String
    let inside:String
    let insideText:String
    var body: some View {
        Group
        {
            Button(
                action: {
                viewmodel.motiveChanges(motyw: theme)
            },label:{
                    VStack{
                        Text(inside).font(.largeTitle).foregroundColor(viewmodel.color)
                        Text(insideText).font(.footnote).foregroundColor(viewmodel.color)
                    }
                }
                
                    )
        }
    }
}

#Preview {
    ThemeButton(viewmodel:MemoGameViewModel(),theme:"Motyw 1",inside:"Motyw 1",insideText:"☀︎")
}
