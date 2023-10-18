//
//  ContentView.swift
//  FlagGame
//
//  Created by MacBook Pro on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    
    @State var choice = Int.random(in: 0...9)
    @State var alreadyCorrect: [Int] = []
    @State var totalCorrect = 0
    @State var totalAttempts = 0
    @State var showAlert = false
    
    // Generate a random index that hasn't been used before
    func GetChoice() {
        while true {
            let randomIndex = Int.random(in: 0..<asean.count)
            if !alreadyCorrect.contains(randomIndex) {
                choice = randomIndex
                return
            }
        }
    }
    
    func checkAnswer(index: Int) {
        if index == choice {
            totalCorrect += 1
            alreadyCorrect.append(choice)
        }
        totalAttempts += 1
        if totalAttempts == 10 {
            showAlert = true
        } else {
            GetChoice()
        }
    }
    
    var body: some View {
        ZStack{
            Color.teal
                .cornerRadius(24)
                .shadow(radius: 12)
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[choice])
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
                        checkAnswer(index: number)
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
                        checkAnswer(index: number)
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
        
        .alert("Game over!", isPresented: $showAlert) {
            Button("Retry", role: .cancel) {
                alreadyCorrect = []
                totalCorrect = 0
                totalAttempts = 0
                GetChoice()
            }
        } message: {
            Text("Benar: \(totalCorrect) dan Salah: \(asean.count-totalCorrect)")
        }
    }
}

#Preview {
    ContentView()
}
