//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    @Binding var inside:String
    @Binding var insideText:String
    var body: some View {
        Group
        {
            VStack{
                Text(inside).font(.largeTitle)
                Text(insideText).font(.footnote)
            }
        }
    }
}

#Preview {
    ThemeButton(inside:.constant("☀︎"),insideText: .constant("Motyw"))
}
