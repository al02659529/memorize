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
            
                Text("Memorize")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
               
            }
          
            ScrollView {
                LazyVGrid(columns: columns ) {
                    ForEach(ViewModel.cards)  { emoji in
                        Card(content: "\(emoji.content)").aspectRatio(2/3, contentMode: .fit)
                    }
                }.font(.largeTitle)
            }
            .padding()
            
            Text("Choose your theme")
                .frame(maxWidth: .infinity, minHeight: 30)
                .background(Color.gray)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
            Spacer()
            HStack {
                Spacer()
//                carsButton
//                Spacer()
//                gesturesButton
//                Spacer()
//                foodButton
//                Spacer()
            }
            .padding()
        }
    }
    
//    var carsButton: some View {
//        Button(action: {
//            selectedEmojis = cars.shuffled()
//        }, label: {
//                VStack {
//                    Image(systemName: "car")
//                    Text("Cars")
//                }
//            })
//    }
//
//    var gesturesButton: some View {
//        Button(action: {
//            selectedEmojis = faceEmojis.shuffled()
//        }, label: {
//                VStack {
//                    Image(systemName: "face.smiling")
//                    Text("Gestures")
//                }
//            })
//    }
//
//    var foodButton: some View {
//        Button(action: {
//            selectedEmojis = food.shuffled()
//        }, label: {
//                VStack {
//                    Image(systemName: "leaf")
//                    Text("Food")
//                }
//            })
//    }
}


struct Card: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
     
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)
                if isFaceUp {
                    Text(content)
                    shape
                        .strokeBorder()
                        .accentColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                }
                else {
                    shape
                        .fill(Color.red)
                }
            }.onTapGesture {
                isFaceUp = !isFaceUp
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = GameViewModel()
        ContentView(ViewModel: game)
    }
}
