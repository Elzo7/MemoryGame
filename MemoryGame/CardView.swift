//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct CardView: View {
    @Binding var inside:String
    @State var hidden:Bool=true
    @State var opacity1:Double=0.0
    @State var opacity2:Double=1.0
    var body: some View {
        ZStack
        {
            Group
            {
                RoundedRectangle(cornerRadius: 12).stroke( .blue,lineWidth: 2).frame(width: 100,height: 100)
                Text(inside)
            }.opacity(opacity1)
            RoundedRectangle(cornerRadius: 12).fill(.blue).frame(width: 100,height: 100).opacity(opacity2)
        }.onTapGesture {
            hidden = !hidden
            opacity2 = hidden ? 1.0 : 0.0
        }
    }
}			

#Preview {
    CardView(inside: .constant("😁"))
}
