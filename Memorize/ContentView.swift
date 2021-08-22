//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Alejandro Rosales Lopez on 07/08/21.
//

import SwiftUI



struct ContentView: View {
    var columns: [GridItem]  = [GridItem(.adaptive(minimum: 90, maximum: 400))]
    @ObservedObject var ViewModel: GameViewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    ViewModel.createNewGame()
                }, label: {
                    
                    VStack {
                        Image(systemName: "plus")
                        Text("New game")
                            .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                    }
                })
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.trailing)
            }
            Section {
                VStack {
                    Text(ViewModel.title)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                
            }
          
            ScrollView {
                LazyVGrid(columns: columns ) {
                    ForEach(ViewModel.cards)  { card in
                        Card(card: card, color: ViewModel.color)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                ViewModel.choose(card)
                            }
                    }
                }
                .font(.largeTitle)
            }
            .padding()
            
            Text("Score")
                .frame(maxWidth: .infinity, minHeight: 30)
                .background(Color.blue)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
            Spacer()
            HStack {
                Spacer()
                Text(String(ViewModel.score))
                    .font(.title2)
                    .bold()
                    
                Spacer()

            }
            
        }
    }
    
}


struct Card: View {
    var card: Game.Card
    let color: Color
    
    var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)
                if card.isFaceUp {
                    Text(card.content)
                    shape
                        .strokeBorder()
                        .accentColor(color)
                        .foregroundColor(color)
                } else if card.isMatchedUp {
                    shape.opacity(0)
                }
                else {
                    shape
                        .fill(color)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = GameViewModel()
        ContentView(ViewModel: game)
    }
}
