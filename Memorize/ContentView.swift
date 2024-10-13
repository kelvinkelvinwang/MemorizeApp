//
//  ContentView.swift
//  Memorize
//
//  Created by Kelvin Wang on 9/13/24.
//

import SwiftUI



struct ContentView: View {
    @State var emojis: Array<String> = []
    var animal = ["🦩","🦩", "🐈", "🐶", "🦊", "🐷", "🐈", "🐶", "🦊", "🐷", "🐇", "🦨", "🦦", "🦔", "🐇", "🦨", "🦦", "🦔"]
    let sports = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾"]
    let food = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉"]
    
    var body: some View {
        Text("Memorize!").font(.largeTitle)
        VStack(){
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode:.fit)
            }
            .foregroundStyle(.orange)
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            Spacer()
            animalSwitcher
            Spacer()
            sportSwitcher
            Spacer()
            fruitSwitcher
            Spacer()
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    var animalSwitcher: some View {
        themeChooser(image: "pawprint", label: animal, systemImageName: "animals")
    }

    var sportSwitcher: some View {
        themeChooser(image: "soccerball", label: sports, systemImageName:  "sports")
    }
    
    func themeChooser(image: String, label: [String], systemImageName: String) -> some View {
        Button(action: {
            emojis.removeAll()
            emojis += label
            emojis.shuffle()
        }, label: {
            VStack{
                Image (systemName: image)
                Text(systemImageName).font(.footnote)
            }

        })
    }
    
    var fruitSwitcher: some View {
        themeChooser(image: "carrot", label: food, systemImageName:  "food")
    }
    
    struct CardView: View {
        let content: String
        @State var isFaceUp = false
        
        
        var body: some View {
            ZStack{
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
                
            }.onTapGesture {
                isFaceUp.toggle()
            }
            
            
        }
    }
    
    
    
    
}
    
    
    #Preview {
        ContentView()
    }
    
