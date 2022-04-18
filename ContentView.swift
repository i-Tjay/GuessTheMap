//
//  ContentView.swift
//  GuessTheMap
//
//  Created by Mac on 12/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State
    @State private var score = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...6)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white, .green, .gray, .yellow], startPoint: .center, endPoint: .bottom)
                .ignoresSafeArea()
                
            
            VStack(spacing: 30) {
                VStack {
            Text("Tap the Flag of")
                        .font(.subheadline.weight(.heavy))
                        .foregroundColor(.red)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .foregroundColor(.black)
        }
            ForEach(0..<6) { number in
            Button {
             flagTapped(number)
            } label: {
                Image(countries[number])
                    .frame(width: 250, height: 100)
                    .clipShape(Capsule())
            }
        }
        }
    }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
        
        }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
}
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

