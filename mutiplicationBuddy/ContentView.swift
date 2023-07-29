//
//  ContentView.swift
//  mutiplicationBuddy
//  DAY35 CHALLENGE #100DaysOfSwiftUI
//  Created by yannemal on 25/07/2023.
//  v1 dissapeared upload new version attempt

import SwiftUI

struct ContentView: View {
    // MARK: - DATA
    
    @State private var choiceNumber : Int = 1
    @State private var choiceDifficulty : Int = 0
    @State private var positionInFormula : String = "c"
    private var numberRounds : Int = 5
    
    // Top Display
    @State private var isTopDisplayVisible = true
    @State private var isHorzFormulaVisible = true
    @State private var isVertFormulaVisible = true
    @State private var aVert = "a"
    @State private var aHorz = "a"
    private let mathOperator = "x"
    @State private var operatorColor = Color(.white)
    @State private var bVert = "b"
    @State private var bHorz = "b"
    private var isSign = "="
    @State private var cVert = "c"
    @State private var cHorz = "c"
    
    // middle display
    @State private var interActiveText = "Don’t fall prey to shiny object syndrome. The lure of spending $100 on another course is high, I know, but you don’t learn anything by buying books. Your best chance of success is sticking with the 100 days shown here and really make it work, so if you’re already thinking “I can do this course at the same time as Other SwiftUI Course” you’re just setting yourself up to fail.."
    //bottom Digits
    @State private var digit = "0"
    @State private var digit1 = "𝟷"
    @State private var digit2 = "𝟤"
    @State private var digit3 = "𝟥"
    @State private var digit4 = "𝟦"
    @State private var digit5 = "𝟧"
    @State private var digit6 = "𝟨"
    @State private var digit7 = "𝟽"
    @State private var digit8 = "𝟪"
    @State private var digit9 = "𝟫"
    @State private var digitL = "<"
    @State private var digitR = ">"
    @State private var spaceBar = "⮐"
    
    // Alert pop up or .. off-screen ZLayer on top animates in and out
    
    
    var body: some View {
        // MARK: - mainVIEW
        
        ZStack {
            
          
                // behind the buttons color for when button invisible or animating
                Color(.blue)
                .ignoresSafeArea()
                .opacity(0.3)
                    
                VStack {
                    
                    // background top 'screen' for Question formula a * b = c
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.gray)
                            .opacity(0.5)
//                        .padding(.bottom)
                        
                        if isTopDisplayVisible {
                            
                            ZStack {
                                // Top Display Text()
                                
                                if isVertFormulaVisible {
                                    
                                    Group {
                                        // Top Display Vertical Formula
                                        VStack{
                                            Text(aVert)
                                                .offset(y: 20)
                                            HStack {
                                                Text(bVert)
                                                Text(mathOperator)
                                                    .foregroundColor(operatorColor)
                                            }
                                            .offset(x: 15.0, y: 20)
                                            Text("-----")
                                            
                                        }
                                        //  Text(cVert)
                                    } // end VSt formula
                                
                                    .offset(x: 7.0, y: -30)
                                    // .font(.system(size: 36))
                            }
                                if isHorzFormulaVisible {
                                HStack{
                                    // formula horizontal display
                                    Group{
                                        Text(aHorz)
                                        Text(mathOperator)
                                            .foregroundColor(operatorColor)
                                        Text(bHorz)
                                        Text(isSign)
                                            .foregroundColor(operatorColor)
                                    }
                                    .offset(x: -25, y: 0.0)
                                    
                                    Text(cHorz)
                                }
                                .offset(x: -55, y: 60.0)
                                
                
                                    
                                    // .offset(x: -55, y: 30.0)
                              }
                            } //end ZSt Top Display TEXT
                            .font(.system(size: 44))
                        } // end IF
                           
                    }  //end ZSt Top Display
                
                    // MARK: - MIDDLE DISPLAY
                    // background black Middle display for animated Question / menu
                    ZStack {
                        // background
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.black)
                            .frame(width: 350, height: 140)
                        .opacity(0.8)
                        // text Layer:
                        Text(interActiveText)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 130)
                    }
                    
                    
                    // MARK: - Digits
                    VStack {
                        //  background for interaction buttons / digits
                        Group {
                            HStack {
                                // Toprow digit
                                ZStack {
                                    // D1
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit1)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                }
                                ZStack {
                                    // D2
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit2)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                }
                                ZStack {
                                    // D3
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit3)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                            HStack {
                                // midrow digit
                                ZStack {
                                    // D4
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit4)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                }
                                ZStack {
                                    // D5
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit5)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                }
                                ZStack {
                                    // D6
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit6)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                            HStack {
                                // bottom row digit
                                ZStack {
                                    // D7
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit7)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                ZStack {
                                    // D8
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit8)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                }
                                ZStack {
                                    // D9
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 100, height: 50, alignment: .center)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Button {
                                        //action
                                    } label: {
                                        Text(digit9)
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                            }
                        } // end Group Digits
                        
                        
                        // background Left and Right <<  >> buttons
                        HStack {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.blue)
                                    .opacity(0.5)
                                    .frame(width: 80, height: 50, alignment: .center)
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.blue)
                                    .opacity(0.7)
                                    .frame(width: 60, height: 40, alignment: .center)
                                Button {
                                    //action
                                } label: {
                                    Text(digitL)
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                }
                            }
                            
                            ZStack {
                                // D9
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                    .frame(width: 100, height: 50, alignment: .center)
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .frame(width: 80, height: 40, alignment: .center)
                                Button {
                                    //action
                                } label: {
                                    Text(digit)
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                }
                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.blue)
                                    .opacity(0.5)
                                    .frame(width: 80, height: 50, alignment: .center)
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.blue)
                                    .opacity(0.7)
                                    .frame(width: 60, height: 40, alignment: .center)
                                Button {
                                    //action
                                } label: {
                                    Text(digitR)
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.init(top: 0.0, leading: 50.0, bottom: 0.0, trailing: 50.0))
                        
                        // Go action button or Return button
                        //background 'spacebar' enter / Go button
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(.black)
                                .opacity(0.5)
                                .frame(width: 220, height: 60, alignment: .center)
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .frame(width: 200, height: 45, alignment: .center)
                            Button {
                                //action
                            } label: {
                                Text(spaceBar)
                                    .font(.system(size: 32))
                                    .foregroundColor(.black)
                            }
                        } .padding(.init(top: 0.0, leading: 60.0, bottom: 0.0, trailing: 60.0))
                        
                        }
                    
                }
                
                .padding()
           
        
                
            } // endZStack
        
            
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



