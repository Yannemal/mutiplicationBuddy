//
//  ContentView.swift
//  mutiplicationBuddy
//  DAY35 CHALLENGE #100DaysOfSwiftUI
//  Created by yannemal on 25/07/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - DATA
    
    @State private var choiceNumber : Int = 1
    @State private var choiceDifficulty : Int = 0
    @State private var positionInFormula : String = "c"
    private var numberRounds : Int = 5
    
    // Alert pop up or .. off-screen ZLayer on top animates in and out
    
    var body: some View {
        // MARK: - mainVIEW
        
        ZStack {
            // behind the buttons color for when button invisible or animating 
            Color(.blue)
                .ignoresSafeArea()
                .opacity(0.3)
            
            VStack {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .padding(.bottom)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.black)
                    .frame(width: 350, height: 150, alignment: .top)
                    .opacity(0.8)
                
                
                
                VStack {
                    
                    ForEach(0..<3) { _ in
                        HStack {
                            ForEach(0..<3){_ in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                            }
                            
                            
                        }
                    }
                    // LEft and Right <<  >> buttons
                    HStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.blue)
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.clear)
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.blue)
                    }
                    .padding(.init(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0))
                    // Go action button or Return button
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.white)
                        .padding(.init(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 40.0))
                }
         
            }
        
        .padding()
        
        
//        List {
//
//            HStack {
//                Text("Lets get started straight away")
//                Spacer()
//                Button(action: {/* pop up sheet */ }, label: {Image(systemName: "info.circle.fill")})
//            }
//
//
//        }
//        .padding(.init(top: 80.0, leading: 0.0, bottom: 0.0, trailing: 30.0))
//        .listStyle(.plain)
        
        
        
    } // end ZS

     
            
            
        } // end someView
    
    
    
    
    
    
    
    /* ************************************************************* */
    /*                                                               */
    /*                      MARK: - METHODS                          */
    /*                                                               */
    /* ************************************************************* */
    
    
    
} //end ContentView

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



