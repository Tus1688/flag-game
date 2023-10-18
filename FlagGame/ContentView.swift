//
//  ContentView.swift
//  FlagGame
//
//  Created by MacBook Pro on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    var angkaRandom = Int.random(in: 0...9)
//    var alreadyCorrect: [Int]
    
    var body: some View {
        ZStack{
            Color.teal
                .cornerRadius(24)
                .shadow(radius: 12)
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[angkaRandom])
                    .bold()
                    .font(.title)
                    .foregroundStyle(.black)
            }
        }
        .padding(.bottom)
        
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                            .cornerRadius(8)
                            .shadow(radius: 8)
                    }
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                            .cornerRadius(8)
                            .shadow(radius: 8)
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
