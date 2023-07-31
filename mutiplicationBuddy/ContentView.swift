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
    @State private var isMidTextAnimating = false
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
                            .font(.body)
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
                                    .animation(.easeInOut(duration: 0.6), value:(currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 1))
                                    .opacity(0.5)
                                    .frame(width: 100, height: 50)
                                               
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .frame(width: 80, height: 40)
                                               
                                Button {
                                    buttonPressed(button: digit1)
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
                                    .animation(.easeInOut(duration: 0.6), value: (currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 3))
                                    .opacity(0.5)
                                    .frame(width: 100, height: 50, alignment: .center)
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .frame(width: 80, height: 40, alignment: .center)
                                Button {
                                    buttonPressed(button: digit3)
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
                                    .animation(.easeInOut(duration: 0.6), value: (currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 4))
                                    .opacity(0.5)
                                    .frame(width: 100, height: 50, alignment: .center)
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .frame(width: 80, height: 40, alignment: .center)
                                Button {
                                    buttonPressed(button: digit4)
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
                                    .animation(.easeInOut(duration: 0.6), value: (currentGameState == GameState.menuScreen && currentMenuSelectionNumber == 6))
                                    .opacity(0.5)
                                    .frame(width: 100, height: 50, alignment: .center)
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .frame(width: 80, height: 40, alignment: .center)
                                Button {
                                    buttonPressed(button: digit6)
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
        
        presentDisplays(time: 1.0)
    }
    
    func presentDisplays(time: Double) {
     
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            withAnimation {
                isTopDisplayVisible = true
                isVertFormulaVisible = true
                isHorzFormulaVisible = true
                isMidDisplayVisible = true
                presentTextAnimated(text: "version 1.2 Day 35 Challenge \n (HINT: press 1)")
  
                areDigitsVisible = true
                isMidDisplayVisible = true
                
                presentMenu()
                // TODO: presentMenu() & presentDisplays() & changeGameState(.menuScreen) all overlap
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
                isMidTextAnimating = false
                isVertFormulaVisible = false
                areDigitsVisible = false
                isMenuVisible = false
                 print("changed to StartScreen")
                
            case .menuScreen:
                currentGameState = GameState.menuScreen
                titleMidDisplay = "Menu"
                isMenuVisible = true
                // if previous state was startScreen then
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                    withAnimation {
                        checkCorrectMenuItemSelection(selection: digit1)
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        // nameView
                    }
                }
                
                print("changed to MenuScreen")
                
            case .modeSelect:
                print("changed to ModeSelect")
            case .difficultySelect:
                print("changed to difficulty Select")
            case .highScoreScreen:
                print("changed to highdscore screen")
            case .preferencesScreen:
                print("changed to preference screen")
            case .beginRound:
                print("changed to begin round")
            case .playRound:
                print("changed to playRound")
            case .pauseGame:
                print("changed to pauseGame")
            case .askQuestion:
                print("changed to askQuestion")
            case .answerQuestion:
                print("changed to answerQuestiom")
            case .scoreQuestion:
                print("changed to ScoreQuestion")
            case .endRound:
                print("changed to endRound")
            case .scoreRound:
                print("changed to scroeRound")
            case .scoreBoard:
                print("changed to sccoreBoard")
            }
        }
        
        func checkCorrectMenuItemSelection(selection: String) {
            if isMenuVisible && currentGameState == GameState.menuScreen {
                
                if selection == digit1 || selection == digit3 || selection == digit4 || selection == digit6 {
                    // check out my OR operators !
                    
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
    //                if let selectionUnwrapped = selection {
                        switch selection {
                        case digit1 : setMenuSelection(inTextForm: selections[0], asNumber: 1)
                        case digit3 : setMenuSelection(inTextForm: selections[1], asNumber: 3)
                        case digit4 : setMenuSelection(inTextForm: selections[2], asNumber: 4)
                        case digit6 : setMenuSelection(inTextForm: selections[3], asNumber: 6)
                        default: textPresented = ""
                            print("error button press : \(selection)")
                        }
                        
                        func setMenuSelection(inTextForm : String, asNumber: Int) {
                            
                            textPresented = inTextForm
                            currentMenuSelectionNumber = asNumber
                            print("new \(currentMenuSelectionNumber)")
                        }
                }
               
                //}
            } // end if statement
        } // endFunc checkCorrectSelectionMenu
            
    func presentTextAnimated(text : String) {
        if isMidTextAnimating == false {
            let textToBePresented = Array(text)
            var buildingText = ""
            var trackLoop : Int = 0
            isMidTextAnimating = true
            
            for i in 0..<text.count {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(i)) {
                    withAnimation {
                        buildingText.append(textToBePresented[i])
                        textPresented = buildingText
                    }
                }
                if trackLoop < text.count {
                    trackLoop += 1
                } else {
                    isMidTextAnimating = false
                }
            }
        } else {
            print("badTime for animatingText")
            // TODO: calculate timer needed and call func within func if poss to delay a 2nd attempt.
            
        }
    }
        func buttonPressed(button : String) {
            
            // check currentGameState to know what to do with what buttonPress add to each button
            switch currentGameState {
                
            case .startScreen:
               
                print("buttonpressed in StartScreen")
                
            case .menuScreen:
                
                
                checkCorrectMenuItemSelection(selection: button)
                
               // print("button \(button) pressed in MenuScreen")
                
                
            case .modeSelect:
                print("button \(button) pressed in ModeSelect")
            case .difficultySelect:
                print("button \(button) pressed in difficulty Select")
            case .highScoreScreen:
                print("button \(button) pressed in highdscore screen")
            case .preferencesScreen:
                print("button \(button) pressed in preference screen")
            case .beginRound:
                print("button \(button) pressed in begin round")
            case .playRound:
                print("button \(button) pressed in playRound")
            case .pauseGame:
                print("button \(button) pressed in pauseGame")
            case .askQuestion:
                print("button \(button) pressed in askQuestion")
            case .answerQuestion:
                print("button \(button) pressed in answerQuestiom")
            case .scoreQuestion:
                print("button \(button) pressed inScoreQuestion")
            case .endRound:
                print("button \(button) pressed in endRound")
            case .scoreRound:
                print("button \(button) pressed in scroeRound")
            case .scoreBoard:
                print("button \(button) pressed in sccoreBoard")
            }
        } // end fun buttonpress
    
        
        
    } //end ContentView
    
    
    // MARK: - PREVIEW
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }



