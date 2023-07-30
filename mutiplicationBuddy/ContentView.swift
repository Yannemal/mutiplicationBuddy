//
//  ContentView.swift
//  mutiplicationBuddy
//  DAY35 CHALLENGE #100DaysOfSwiftUI
//  Created by yannemal on 25/07/2023.
//  v1 dissapeared upload new version attempt

import SwiftUI

struct ContentView: View {
    // MARK: - DATA
    
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
    @State private var isMidDisplayVisible = true
    @State private var titleMidDisplay = ""
    @State private var textPresented = ".."
    //bottom Digits
    var numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @State private var areDigitsVisible = true
    
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
    
    @State private var currentGameState = GameState.startScreen
    // game states to cycle through > little too advanced whay I'm trying to do here
    enum GameState {
        case startScreen
        case menuScreen
        case modeSelect
        case difficultySelect
        case highScoreScreen
        case preferencesScreen
        case beginRound
        case playRound
        case pauseGame
        case askQuestion
        case answerQuestion
        case scoreQuestion
        case endRound
        case scoreRound
        case scoreBoard
    }
    
    @State private var isMenuVisible = false
    @State private var currentMenuSelectionNumber = 0

  // @State private var MenuSelectionCorrect = possMenuSelections[0]
    
    enum GameMode {
        case tableRun
    }
    
    @State private var tableSelected : Int = 1
    @State private var levelDifficulty : Int = 1
    @State private var currentRound : Int = 0
    @State private var currentQuestion : Int = 0
    @State private var questionsCorrect : Int = 0
    @State private var score : Int = 0
    @State private var roundsCompleted = 0
    
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
                    
                    
                    
                    ZStack {
                        // Top Display Text()
                        
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
                                
                            } .opacity(isVertFormulaVisible ? 1.0 : 0.0)
                            //  Text(cVert)
                        } // end VSt formula
                        
                        .offset(x: 7.0, y: -30)
                        // .font(.system(size: 36))
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
                            .opacity(isHorzFormulaVisible ? 1.0 : 0.0)
                            .offset(x: -25, y: 0.0)
                            
                            Text(cHorz)                                                                    .opacity(isVertFormulaVisible ? 1.0 : 0.0)
                        }
                        
                        .offset(x: -55, y: 60.0)
                        
                        
                        
                        // .offset(x: -55, y: 30.0)
                        
                    } //end ZSt Top Display TEXT
                    .opacity(isTopDisplayVisible ? 1.0 : 0.0)
                    .font(.system(size: 44))
                    
                    
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
                    VStack {
                        Text(titleMidDisplay)
                            .opacity(isMidDisplayVisible ? 1.0 : 0.0)
                            .foregroundColor(.white)
                            .bold()
                        Text(textPresented)
                            .opacity(isMidDisplayVisible ? 1.0 : 0.0)
                            .font(isMenuVisible ? .uppercaseSmallCaps(.headline)() : .body)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 100)
                    }
                }
                
                
                // MARK: - Digits
                VStack {
                    //  background for interaction buttons / digits
                    Group {
                        HStack {
                            // Toprow digit
                            // TODO: replace repeat Digit button code w a struct
                            
                            ZStack {
                                // D1
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor((currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 1) ? .white : .black)
                                    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: (currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 1))
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
                                        .font(.system(size: 32))
                                        .foregroundColor(isMenuVisible ? .gray : .white)
                                }
                            }
                            ZStack {
                                // D3
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor((currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 3) ? .white : .black)
                                    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: (currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 3))
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
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
                                    .foregroundColor((currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 4) ? .white : .black)
                                    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: (currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 4))
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
                                        .font(.system(size: 32))
                                        .foregroundColor(isMenuVisible ? .gray : .white)
                                }
                            }
                            ZStack {
                                // D6
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor((currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 6) ? .white : .black)
                                    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: (currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 6))
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
                                        .font(.system(size: 32))
                                        .foregroundColor(isMenuVisible ? .gray : .white)
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
                                        .font(.system(size: 32))
                                        .foregroundColor(isMenuVisible ? .gray : .white)
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
                                        .opacity(areDigitsVisible ? 1.0 : 0.0)
                                        .font(.system(size: 32))
                                        .foregroundColor(isMenuVisible ? .gray : .white)
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
                                    .opacity(areDigitsVisible ? 1.0 : 0.0)
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
                                    .opacity(areDigitsVisible ? 1.0 : 0.0)
                                    .font(.system(size: 32))
                                    .foregroundColor(isMenuVisible ? .gray : .white)
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
                                    .opacity(areDigitsVisible ? 1.0 : 0.0)
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
                                .opacity(areDigitsVisible ? 1.0 : 0.0)
                                .font(.system(size: 32))
                                .foregroundColor(isMenuVisible ? .green : .black)
                        }
                    } .padding(.init(top: 0.0, leading: 60.0, bottom: 0.0, trailing: 60.0))
                    
                }
                
            }
            
            .padding()
            
            
            
        } // endZStack User INterface
        .onAppear {
            currentGameState = GameState.startScreen
            bootGame()
        }
        
    } // end someView
    
    
    
    /* ************************************************************* */
    /*                                                               */
    /*                      MARK: - METHODS                          */
    /*                                                               */
    /* ************************************************************* */
    
    func bootGame() {
        // TODO: checkPreferences
        changeGameState(state: .startScreen)
        
        presentDisplays(time: 1.8)
    }
    
    func presentDisplays(time: Double) {
        // with a delay using a timer set bools to true to turn on Top Mid Digit Displays
        
        var timings = [0.0]
        let timeInTenths = time / 10
        
        // create an array for times to be used in the number of disp1 timers below based on Input
        for _ in 0...5 {
            if let lastElement = timings.last {
                let correctedTiming = lastElement + timeInTenths
                timings.append(correctedTiming)
            }
        }
        
        isMidDisplayVisible = true
        presentTextAnimated(text: "version 1.2 Day 35 Challenge .. 100DaysOfSwiftUI")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation {
                // these timers load texts up in the beginning
                for _ in 0...timings.count {
                    // TODO: make a simpler for loop
                    DispatchQueue.main.asyncAfter(deadline: .now() + timings[0]) {
                        withAnimation(.linear(duration: 0.6)) {
                            areDigitsVisible = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() +  timings[1]) {
                            withAnimation(.linear(duration: 0.6)) {
                                isMidDisplayVisible = true
                                
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() +  timings[2]) {
                                withAnimation(.linear(duration: 0.6)){
                                    isTopDisplayVisible = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() +  timings[3]) {
                                    withAnimation(.linear(duration: 0.4)) {
                                        isVertFormulaVisible = true
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() +  timings[4]) {
                                        withAnimation(.linear(duration: 0.7)) {
                                            isHorzFormulaVisible = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            withAnimation {
                                                presentTextAnimated(text:  "...  loading")
                                                
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                withAnimation {
                                                    presentTextAnimated(text: "...")
                                                }
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                    withAnimation {
                                                        presentTextAnimated(text: "")
                                                    }
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                                        withAnimation {
                                                            presentMenu()
                                                        }
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                                                            withAnimation {
                                                                checkCorrectMenuItemSelection(selection: 1)
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } // timings != nil ?
                    }
                }
                
            }
        }
        
    } // end func presentDisplays
        
            func presentMenu() {
                changeGameState(state: .menuScreen)

            }
        
        func changeGameState(state: GameState) {
            // slowly figuring out how to apply gameStates .. and look a Switch can have multiple lines of code
            
            switch state {
                
            case .startScreen:
                // see bootGame()
                isTopDisplayVisible = false
                isHorzFormulaVisible = false
                isMidDisplayVisible = false
                isVertFormulaVisible = false
                areDigitsVisible = false
                isMenuVisible = false
                print("in StartScreen")
                
            case .menuScreen:
                currentGameState = GameState.menuScreen
                titleMidDisplay = "Menu"
                isMenuVisible = true
                print("in MenuScreen")
                
            case .modeSelect:
                print("code")
            case .difficultySelect:
                print("code")
            case .highScoreScreen:
                print("code")
            case .preferencesScreen:
                print("code")
            case .beginRound:
                print("code")
            case .playRound:
                print("code")
            case .pauseGame:
                print("code")
            case .askQuestion:
                print("code")
            case .answerQuestion:
                print("code")
            case .scoreQuestion:
                print("code")
            case .endRound:
                print("code")
            case .scoreRound:
                print("code")
            case .scoreBoard:
                print("code")
            }
        }
        
        func checkCorrectMenuItemSelection(selection: Int) {
            if isMenuVisible && currentGameState == GameState.menuScreen {
                let menuItems = ["1. how to play      ", "3. stage select ", "4. highScores        ", "6. preferences"]
                
                let selections = [
"""
\(menuItems[0].uppercased()) \(menuItems[1])\n
\(menuItems[2]) \(menuItems[3])
""",

"""
\(menuItems[0]) \(menuItems[1].uppercased())\n
\(menuItems[2]) \(menuItems[3])
""",

"""
\(menuItems[0]) \(menuItems[1])\n
\(menuItems[2].uppercased()) \(menuItems[3])
""",

"""
\(menuItems[0]) \(menuItems[1])\n
\(menuItems[2]) \(menuItems[3].uppercased())
"""
                ]
                
                switch selection {
                case 1 : setMenuSelection(inTextForm: selections[0], asNumber: 1)
                case 2 : setMenuSelection(inTextForm: selections[1], asNumber: 2)
                case 3 : setMenuSelection(inTextForm: selections[2], asNumber: 3)
                case 4 : setMenuSelection(inTextForm: selections[3], asNumber: 4)
                default: textPresented = ""
                }
                
                func setMenuSelection(inTextForm : String, asNumber: Int) {
                    textPresented = inTextForm
                    currentMenuSelectionNumber = asNumber
                }
            } // end if statement
        } // endFunc checkCorrectSelectionMenu
            
        func presentTextAnimated(text : String) {
            let textToBePresented = Array(text)
            var buildingText = ""
            
            
            for i in 0..<text.count {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(i)) {
                    withAnimation {
                        buildingText.append(textToBePresented[i])
                        textPresented = buildingText
                    }
                }
            }
        }
        
        func buttonPressed(_ : String) {
            
            // check currentGameState to know what to do with what buttonPress add to each button
            
        }
        
    } //end ContentView
    
    
    // MARK: - PREVIEW
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }



