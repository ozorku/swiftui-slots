//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by Adavize Ozorku on 02/01/2021.
//


import SwiftUI

struct ContentView: View {
    // state
    @State private var score:Int = 1000
    var slots = ["cherry", "apple", "star"]
    //
    @State private var slot1:String = "apple"
    @State private var slot2:String = "apple"
    @State private var slot3:String = "apple"
    
    var body: some View {
        VStack() {
            Spacer()
            Text("SwiftUI Slots!")
                .font(.largeTitle)
                .fontWeight(.medium)
            Spacer()
            Text("Credits: " + String(score))
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Image(slot1).resizable().frame(width: 120, height: 120)
                Image(slot2).resizable().frame(width: 120, height: 120)
                Image(slot3).resizable().frame(width: 120, height: 120)
                Spacer()
            }
            Spacer()
            Button(action: {
                spin()
            }, label: {
                Text("Spin").font(.body).fontWeight(.semibold).padding(.horizontal, 30.0).padding(.vertical, 10.0).background(Color.red).cornerRadius(40).foregroundColor(.white)
            })
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
    
    func spin() {
        slot1 = slots[Int.random(in: 0..<slots.count)]
        slot2 = slots[Int.random(in: 0..<slots.count)]
        slot3 = slots[Int.random(in: 0..<slots.count)]
        if((slot1 == slot2 && slot1 == slot3 && slot2 == slot3)) {
            score += 1
        } else {
            score -= 5
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
