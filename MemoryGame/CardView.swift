//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct CardView: View {
    @Binding var inside:String
    @Binding var themeColor:Color
    @State var hidden1:Bool=true
    @State var hidden2:Bool=true
    @State var opacity1:Double=0.0
    @State var opacity2:Double=1.0
    var body: some View {
        HStack
        {
            
                ZStack
                {
                    Group
                    {
                    
                    
                    RoundedRectangle(cornerRadius: 12).fill(.white).stroke( themeColor,lineWidth: 2)
                        Text(inside).font(.largeTitle)
                    RoundedRectangle(cornerRadius: 12).fill(themeColor).opacity(opacity2)
                   
                    }
                }.onTapGesture {
                    hidden1 = !hidden1
                    opacity2 = hidden1 ? 1.0 : 0.0
                
                
            }
        }
    }
}			

#Preview {
    CardView(inside: .constant("😁"),themeColor: .constant(Color.blue))
}
